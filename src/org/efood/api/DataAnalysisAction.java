package org.efood.api;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.efood.service.OrderService;
import org.json.simple.JSONArray;

import com.opensymphony.xwork2.ActionSupport;

public class DataAnalysisAction extends ActionSupport {

	private OrderService orderService;

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public void getOrderData() throws IOException {
		HashMap<String, Integer> map = orderService.getOrderData();

		ArrayList<HashMap<Object, Object>> list = new ArrayList<>();

		Set<Entry<String, Integer>> entrySet = map.entrySet();

		for (Entry<String, Integer> entry : entrySet) {

			HashMap<Object, Object> jsonMap = new HashMap<>();

			jsonMap.put("name", entry.getKey());
			jsonMap.put("num", entry.getValue());

			list.add(jsonMap);

		}
			
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("html/json;charset=UTF-8");
		response.getWriter().write(JSONArray.toJSONString(list));
	}
}
