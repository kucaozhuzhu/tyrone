package com.tyrone.baseframework.listener;

import java.util.Collection;
import java.util.Iterator;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;

public class SessionView {

	public static void show(ServletRequest request, String step) {
		show((HttpServletRequest) request, step);
	}

	public static void show(HttpServletRequest request, String step) {

		//HttpSession session = request.getSession();
		show(/*session, */step,request.getRequestURI());
	}

	public static void show(/*HttpSession session, */String step, String uri) {
		Session session = SecurityUtils.getSubject().getSession();
		Collection<Object> enu = session.getAttributeKeys();
		StringBuilder sb = new StringBuilder();
		sb.append("================").append(session.getId()).append("================\n");
		sb.append(">>>>>>").append(step).append("<<<<<<\n");
		sb.append(">>>>>>").append(uri).append("\n");
		Iterator<Object> iter = enu.iterator();
		while (iter.hasNext()) {
			Object name = iter.next();
			sb.append(name).append(" : ").append(session.getAttribute(name));
			sb.append("\n");
		}
		sb.append("====================================================================");
		
	}
}
