package com.itvmg.util;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class XMLEditer {
	private Document doc;

	public XMLEditer(String loadFilePath) {
		try {
			String path = loadFilePath;
			doc = getDocumentBuilder().parse(path);
			doc.getDocumentElement().normalize();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private DocumentBuilder getDocumentBuilder() {
		try {
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();
			return builder;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public Element[] getElements(String tagName) {
		NodeList nList = doc.getElementsByTagName(tagName);
		Element[] elements = new Element[nList.getLength()];
		for (int i = 0; i < elements.length; i++) {
			elements[i] = getElement(tagName, i);
		}
		return elements;
	}

	public Element[] getElements(Element parent, String tagName) {

		NodeList nList = parent.getElementsByTagName(tagName);
		Element[] elements = new Element[nList.getLength()];
		for (int i = 0; i < elements.length; i++) {
			elements[i] = (Element) parent.getElementsByTagName(tagName).item(i);
		}
		return elements;
	}

	public Element getElement(String tagName, int index) {
		return (Element) doc.getElementsByTagName(tagName).item(index);
	}

	public Element getRootElement() {
		return doc.getDocumentElement();
	}

	public Document getXMLDocument() {
		return doc;
	}

	public Element removeElement(Element parent, Element oldElement) {
		return (Element) parent.removeChild(oldElement);
	}

	public Element replaceElement(Element parent, Element newElement, Element oldElement) {
		return (Element) parent.replaceChild(newElement, oldElement);
	}

	public Element appendElement(Element parent, Element newElement) {
		return (Element) parent.appendChild(newElement);
	}

	public Element createElement(String tagName) {
		return doc.createElement(tagName);
	}

	public void setTextContent(Element element, String textContent) {
		element.setTextContent(textContent);
	}

	public String getTextContent(Element element) {
		return element.getTextContent();
	}

	public void removeAttribute(Element element, String name) {
		element.removeAttribute(name);
	}

	public void setAttribute(Element element, String name, String value) {
		element.setAttribute(name, value);
	}

	public String getAttribute(Element element, String name) {
		return element.getAttribute(name);
	}

	public void createComment(String data) {
		getRootElement().appendChild(doc.createComment(data));
	}
}