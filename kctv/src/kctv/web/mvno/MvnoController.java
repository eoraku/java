package kctv.web.mvno;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kctv.web.common.Common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.ModelAndView;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;

@Controller
public class MvnoController {
	@Autowired
	private SqlMapClientTemplate sqlMapClientTemplate;
	
	private ModelAndView mav;

	@SuppressWarnings("deprecation")
	@RequestMapping(value="/getServiceablePhoneList.json",produces="text/plain;charset=UTF-8")
	public @ResponseBody String getServiceablePhoneListByManufacturer(HttpSession session, HttpServletRequest request) {
		Map<String, Object> resultMap = new HashMap <String, Object>();
		
		try {
			ArrayList<Mvno> phoneList = null;
			String type = request.getParameter("type");
			switch(Integer.parseInt(type)){
				case 1:
					phoneList = (ArrayList<Mvno>) sqlMapClientTemplate.queryForList("getPhoneList", request.getParameter("manufacturer"));
					//System.out.println("카테고리 검색");
					break;
				case 2:
					//System.out.println("모델명 검색");
					//System.out.println("모델명:" + URLDecoder.decode(request.getParameter("encodeModelName"), "UTF-8"));
					phoneList = (ArrayList<Mvno>) sqlMapClientTemplate.queryForList("searchPhoneList", URLDecoder.decode(request.getParameter("encodeModelName"), "UTF-8"));
					break;
			}
			
			resultMap.put("list", phoneList);
			ObjectMapper objectMapper = new ObjectMapper();
			String jsonStr = objectMapper.writeValueAsString(resultMap);
			//System.out.println(Common.toUTF8(jsonStr));
			return jsonStr; 
		} catch (Exception e) {
			e.printStackTrace();
			return "데이터를 가져오는 도중 오류가 발생하였습니다. 관리자에게 문의해 주십시오.";
		}
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value="/doInsertContact.json",produces="text/plain;charset=UTF-8")
	public @ResponseBody String doInsertContact(HttpSession session, @ModelAttribute MvnoContactDTO mvnoContactDTO) {
		Map<String, Object> resultMap = new HashMap <String, Object>();
		String table_name = "mvno_contact_signup";
		
		try {
			/*
			System.out.println("##########시작##########");
			System.out.println("시큐 : " + mvnoContactDTO.getSeq());
			System.out.println("이름 : " + URLDecoder.decode(mvnoContactDTO.getName(), "UTF-8"));
			System.out.println("전화번호: " + mvnoContactDTO.getPhone());
			System.out.println("우편번호: " + mvnoContactDTO.getZipcode());
			System.out.println("주소: " + URLDecoder.decode(mvnoContactDTO.getAddress(), "UTF-8"));
			System.out.println("관심서비스 : " + mvnoContactDTO.getService());
			System.out.println("등록일 : " + mvnoContactDTO.getReg_date());
			System.out.println("요청사항 : " + URLDecoder.decode(mvnoContactDTO.getMemo(), "UTF-8"));
			System.out.println("삭제 : " + mvnoContactDTO.getDel_flag());
			System.out.println("회신 : " + mvnoContactDTO.getReply_flag());
			System.out.println("회신일 : " + mvnoContactDTO.getReply_date());
			System.out.println("###########끝###########");
			*/
			mvnoContactDTO.setName(URLDecoder.decode(mvnoContactDTO.getName(), "UTF-8"));
			mvnoContactDTO.setAddress(URLDecoder.decode(mvnoContactDTO.getAddress(), "UTF-8"));
			mvnoContactDTO.setMemo(URLDecoder.decode(mvnoContactDTO.getMemo(), "UTF-8"));
			mvnoContactDTO.setSeq((Integer) sqlMapClientTemplate.queryForObject("getNextInsertSeq", table_name));
			sqlMapClientTemplate.insert("doInsertMvnoContact", mvnoContactDTO);
			
			resultMap.put("result", "ok");
			ObjectMapper objectMapper = new ObjectMapper();
			String jsonStr = objectMapper.writeValueAsString(resultMap);

			//System.out.println(Common.toUTF8(jsonStr));
			return jsonStr; 
		} catch (Exception e) {
			e.printStackTrace();
			return "데이터를 처리하는 도중 오류가 발생하였습니다. 관리자에게 문의해 주십시오.";
		}
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value="/doGetMvnocontact.json",produces="text/plain;charset=UTF-8")
	public @ResponseBody String doGetMvnocontact(HttpSession session, HttpServletRequest request) {
		Map<String, Object> resultMap = new HashMap <String, Object>();
		
		try {
			String userid = null;
			String name = null;
			String level = null;
			
			if(session.getAttribute("userid") != null){
				userid = session.getAttribute("userid").toString();
			}
			if(session.getAttribute("name") != null){
				name = session.getAttribute("name").toString();
			}
			if(session.getAttribute("level") != null){
				level = session.getAttribute("level").toString();
			}
//			System.out.println("아이디 : " + userid + ", 이름 : " + name + ", 권한 : " + level);
			
 			if(level != null && level.equals("90")){
				Integer listCount;
				ArrayList<MvnoContactDTO> mvnoContactList = null;

				listCount = (Integer) sqlMapClientTemplate.queryForObject("getMvnoContactListCount");
				mvnoContactList = (ArrayList<MvnoContactDTO>) sqlMapClientTemplate.queryForList("getMvnoContactList");
				
				resultMap.put("paging", listCount.intValue());
				resultMap.put("list", mvnoContactList);
			}else{
				resultMap.put("result", "noPermission");
				ObjectMapper objectMapper = new ObjectMapper();
				String jsonStr = objectMapper.writeValueAsString(resultMap);
				return jsonStr;
			}
			
			resultMap.put("result", "ok");
			ObjectMapper objectMapper = new ObjectMapper();
			String jsonStr = objectMapper.writeValueAsString(resultMap);
			
			//System.out.println(Common.toUTF8(jsonStr));
			return jsonStr; 
		} catch (Exception e) {
			e.printStackTrace();
			return "데이터를 가져오는 도중 오류가 발생하였습니다. 관리자에게 문의해 주십시오.";
		}
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value="/doDeleteContact.json",produces="text/plain;charset=UTF-8")
	public @ResponseBody String doDeleteContact(HttpSession session, HttpServletRequest request) {
Map<String, Object> resultMap = new HashMap <String, Object>();
		
		try {
			String userid = null;
			String name = null;
			String level = null;
			
			if(session.getAttribute("userid") != null){
				userid = session.getAttribute("userid").toString();
			}
			if(session.getAttribute("name") != null){
				name = session.getAttribute("name").toString();
			}
			if(session.getAttribute("level") != null){
				level = session.getAttribute("level").toString();
			}
//			System.out.println("아이디 : " + userid + ", 이름 : " + name + ", 권한 : " + level);
			if(request.getParameter("seq") == null || request.getParameter("seq") == ""){
				resultMap.put("result", "noSelect");
				ObjectMapper objectMapper = new ObjectMapper();
				String jsonStr = objectMapper.writeValueAsString(resultMap);
				return jsonStr;
			}
			
			
 			if(level != null && level.equals("90")){
 				MvnoContactDTO dto = new MvnoContactDTO();
 				dto.setSeq(Integer.parseInt(request.getParameter("seq")));
 				dto.setMod_admin(userid);
 				sqlMapClientTemplate.update("deleteMvnoContact", dto);
			}else{
				resultMap.put("result", "noPermission");
				ObjectMapper objectMapper = new ObjectMapper();
				String jsonStr = objectMapper.writeValueAsString(resultMap);
				return jsonStr;
			}
			
			resultMap.put("result", "ok");
			ObjectMapper objectMapper = new ObjectMapper();
			String jsonStr = objectMapper.writeValueAsString(resultMap);
			//System.out.println(Common.toUTF8(jsonStr));
			
			return jsonStr; 
		} catch (Exception e) {
			e.printStackTrace();
			return "데이터를 가져오는 도중 오류가 발생하였습니다. 관리자에게 문의해 주십시오.";
		}
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value="/doFinishContact.json",produces="text/plain;charset=UTF-8")
	public @ResponseBody String doFinishContact(HttpSession session, HttpServletRequest request) {
		Map<String, Object> resultMap = new HashMap <String, Object>();
		
		try {
			String userid = null;
			String name = null;
			String level = null;
			
			if(session.getAttribute("userid") != null){
				userid = session.getAttribute("userid").toString();
			}
			if(session.getAttribute("name") != null){
				name = session.getAttribute("name").toString();
			}
			if(session.getAttribute("level") != null){
				level = session.getAttribute("level").toString();
			}
//			System.out.println("아이디 : " + userid + ", 이름 : " + name + ", 권한 : " + level);
			if(request.getParameter("seq") == null || request.getParameter("seq") == ""){
				resultMap.put("result", "noSelect");
				ObjectMapper objectMapper = new ObjectMapper();
				String jsonStr = objectMapper.writeValueAsString(resultMap);
				return jsonStr;
			}
			
			if(level != null && level.equals("90")){
				MvnoContactDTO dto = new MvnoContactDTO();
				dto.setSeq(Integer.parseInt(request.getParameter("seq")));
 				dto.setMod_admin(userid);
				
				sqlMapClientTemplate.update("doFinishMvnoContact", dto);
			}else{
				resultMap.put("result", "noPermission");
				ObjectMapper objectMapper = new ObjectMapper();
				String jsonStr = objectMapper.writeValueAsString(resultMap);
				return jsonStr;
			}
			
			resultMap.put("result", "ok");
			ObjectMapper objectMapper = new ObjectMapper();
			String jsonStr = objectMapper.writeValueAsString(resultMap);
			//System.out.println(Common.toUTF8(jsonStr));
			
			return jsonStr; 
		} catch (Exception e) {
			e.printStackTrace();
			return "데이터를 가져오는 도중 오류가 발생하였습니다. 관리자에게 문의해 주십시오.";
		}
	}
}
