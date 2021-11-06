package org.kosta.moco.controller;

public class HandlerMapping {
	private static HandlerMapping instance = new HandlerMapping();
	
	private HandlerMapping() {}
	
	public static HandlerMapping getInstance() {
		return instance;
	}
	
	public Controller create(String command) throws InstantiationException, IllegalAccessException, ClassNotFoundException {
		String classInfo = new StringBuilder(this.getClass().getPackage().getName()).append("." + command).toString();
		
		Controller controller = (Controller) Class.forName(classInfo).newInstance();
		System.out.println(controller);
		return controller;
	}
}
