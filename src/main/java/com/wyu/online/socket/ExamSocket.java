package com.wyu.online.socket;

import java.io.IOException;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;

import com.wyu.online.base.BaseContext;

/**
 * webSocket 使用 控制考试时间
 *
 * Created by Administrator on  2018/7/16
 */
@ServerEndpoint(value = "/mysocket", configurator = BaseContext.class)
public class ExamSocket {

	private static CopyOnWriteArraySet<ExamSocket> webSocket = new CopyOnWriteArraySet<ExamSocket>();

	private Session session;

	private ServletContext context = null;
	private HttpSession httpSession = null;

	/**
	 * 连接建立成功调用的方法
	 * @param session
	 * @param config
	 */
	@OnOpen
	public void onOpen(Session session, EndpointConfig config) {
		this.session = session;
		webSocket.add(this);
		context = (ServletContext) config.getUserProperties().get(ServletContext.class.getName());
		httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());

		String username = "admin1";
		context.setAttribute(username, this);

	}

	/**
	 * 连接关闭调用的方法
	 */
	@OnClose
	public void onClose() {
		String username = "admin1";
		context.removeAttribute(username);
	}

	/**
	 * 收到客户端消息后的调用方法
	 * @param message
	 * @param session
	 */
	@OnMessage
	public void onMessage(String message, Session session) {
		if (message != null) {
			switch (message) {
			case "start":

				break;
			}
		}
		try {
			sendMessage("i have reveive message: " + message);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@OnError
	public void onError(Session session, Throwable error) {
		System.out.println(error);
	}

	public void sendMessage(String message) throws IOException {
		session.getBasicRemote().sendText(message);
	}

	public static void main(String[] args) {


	}


	//小疑问:java比较时间这一块还没有弄清楚。

}
