package kctv.web.vod;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kctv.web.board.BoardPaging;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kctv.web.common.Common;
import kctv.web.common.CountUpdate;

/**
 * <pre>
 * kctv.web.vod
 * VodController.java
 * </pre>
 * <pre>
 * VOD 서비스 컨트롤러
 * </pre>
 * 
 * @author : 강우진
 * @date   : 2013. 12. 16.
 * @version: 
 */
@Controller
@RequestMapping("/vod")
public class VodController {
	@Value("#{config['serverType']}") String serverType;
	@Value("#{config['ctxRoot']}") String ctxRoot;
	@Autowired private SqlMapClientTemplate sqlMapClientTemplate;
	
	ModelAndView mav;
	HttpSession session;
	String menu;
	String muid;
	int pageNo;
	int total;
	String tmp;
	String maincd;
	String subcd;
	String schType;
	String schText;
	
	/**
	 * @function : view페이지 이동을 위한 메서드
	 * @process  : 
	 * 
	 * @MethodName : common
	 * @param session
	 * @param page
	 */
	private void common(HttpSession session,String page){
		this.session = session;
		
		mav = new ModelAndView("vod/"+page);
		mav.addObject("ctxRoot",ctxRoot);
	}
	
	/**
	 * @function : VOD 다시보기 페이지 리스트
	 * @process  : 
	 * 
	 * @MethodName : list_vod
	 * @param request
	 * @param maincd
	 * @param subcd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/{maincd}/{subcd}/list_vod.htm",method=RequestMethod.GET)
	public ModelAndView list_vod(HttpServletRequest request,@PathVariable("maincd") String maincd,@PathVariable("subcd") String subcd) throws Exception {
		common(request.getSession(),"list_vod");
		setRequestParameter(request);
		
		if(muid.equals("113")){
			setProgramCd(maincd,subcd);
		}
		
		ArrayList<Vod> vodList;
		VodParameter vodParameter=new VodParameter(pageNo,maincd,subcd,schType,schText);
		
		vodList = (ArrayList<Vod>)sqlMapClientTemplate.queryForList("listVod",vodParameter);
		total = (Integer)sqlMapClientTemplate.queryForObject("cntVod",vodParameter);
		
		for(Vod item:vodList){
			if(item.getPhoto_url() != null && item.getPhoto_url().length()>0)
				item.setPhoto_url(ctxRoot+"upload/vod/"+item.getPhoto_url());
			else
				item.setPhoto_url(ctxRoot+"images/vod/default.gif");
		}
		
		BoardPaging vodPaging = new BoardPaging(pageNo,total,10);
		
		mav.addObject("vodList",vodList);
		mav.addObject("vodTotal",total);
		mav.addObject("vodPaging",vodPaging);
		mav.addObject("urlQuery","?muid="+muid+"&maincd="+maincd+"&subcd="+subcd+"&guid="+subcd);
		mav.addObject("guid", subcd);
		
		return mav;
	}
	
	/**
	 * @function : vod 보기 페이지
	 * @process  : vod 파일이 있을 경우에 vod정보를 받아오고 조회수 카운트 증가 
	 * 
	 * @MethodName : view_vod
	 * @param session
	 * @param type
	 * @param num
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/{type}/{num}/view.htm",method=RequestMethod.GET)
	public ModelAndView view_vod(HttpSession session,@PathVariable("type") String type,@PathVariable("num") int num) throws Exception {
		common(session,"view_"+type);
		
		if((type.equals("wmv") || type.equals("flv")) && num>0){
			
			Vod vod = (Vod)sqlMapClientTemplate.queryForObject("getVodInfo",num);
			
			if(vod!=null){
				vod.setContent(Common.replaceLineToBR(vod.getContent()));
				
				if(vod.getSubcd().trim().equals("238")){
					vod.setSvrfile("eng/"+vod.getFirstdt().replace("-", "").substring(2)+"n5.flv");
					mav.addObject("engchi","eng");
				}else if(vod.getSubcd().trim().equals("312")){
					vod.setSvrfile("cn/"+vod.getFirstdt().replace("-", "").substring(2)+"n7.flv");
					mav.addObject("engchi","chi");
				}else{
					vod.setSvrfile(num+".flv");
					mav.addObject("engchi",false);
				}
				
				CountUpdate countUpdate = new CountUpdate("vodlist","view_cnt","num="+num);
				sqlMapClientTemplate.update("cntUpdate",countUpdate);
			}
			
			mav.addObject("vod",vod);
		}else if(type.equals("live") && num>0){
			String liveCh = null;
			if(num==7)
				liveCh = "http://www.kctvjeju.com/a/CH7.asx";
			else if(num==20)
				liveCh = "http://www.kctvjeju.com/a/CH20.asx";
			mav.addObject("liveCh",liveCh);
		}
		
		return mav;
	}
	
	/**
	 * @function : MainCode,SubCode 조회
	 * @process  : 프로그램 mainCode와 SubCode를 조회하여 ModelAndView에 추가
	 * 
	 * @MethodName : setProgramCd
	 * @param mcd
	 * @param scd
	 */
	@SuppressWarnings("unchecked")
	private void setProgramCd(String mcd, String scd){
		int maincd = Integer.parseInt(mcd);
		//int subcd = Integer.parseInt(scd);
		
		mav.addObject("listMainCd",(ArrayList<VodCode>)sqlMapClientTemplate.queryForList("getMainCd"));
		if(maincd>0)
			mav.addObject("listSubCd",(ArrayList<VodCode>)sqlMapClientTemplate.queryForList("getSubCd",maincd));
	}
	
	/**
	 * @function : 검색하는 VOD에 대한 파라미터 Setter
	 * @process  : 페이지정보, 요청 페이지(muid)정보를 이용하여 검색어 및 검색타입 정보를 ModelAndView에 추가
	 * 
	 * @MethodName : setRequestParameter
	 * @param request
	 * @throws Exception
	 */
	private void setRequestParameter(HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("euc-kr");
		
		this.muid = Common.strToStr(request.getParameter("muid"));
		this.pageNo = Common.strToInt(request.getParameter("pageNo"),1);
		this.schType = Common.strToStr(request.getParameter("schType"));
		this.schText = Common.toEUCKR(Common.strToStr(request.getParameter("schText")));
		
		mav.addObject("schType",schType);
		mav.addObject("schText",schText);
	}
}
