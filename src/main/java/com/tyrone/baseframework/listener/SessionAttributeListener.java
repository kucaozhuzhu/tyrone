package com.tyrone.baseframework.listener;

import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SessionAttributeListener implements HttpSessionAttributeListener, HttpSessionListener {
	 private static Logger log = LoggerFactory.getLogger(SessionAttributeListener.class);

	@Override
	public void attributeAdded(HttpSessionBindingEvent event) {
		this.info("attributeAdded", event);
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent event) {
		this.info("attributeRemoved", event);
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent event) {
		this.info("attributeReplaced", event);
	}

	private void info(String type, HttpSessionBindingEvent event) {
		String msg = String.format("===================================\n%1$s:>\t%2$s.%3$s == %4$s\n===================================", type,
				event.getSession().getId(), event.getName(), event.getValue());
		log.info(msg);
		
	}
	// ==========================================

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		this.info("sessionCreated", se);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		this.info("sessionDestroyed", se);
	}

	private void info(String type, HttpSessionEvent se) {
		String msg = String.format("===================================\ntype=%2$s:>sessionID=%1$s\n===================================", se.getSession().getId(),type);
		log.info(msg);
		
	}

}
