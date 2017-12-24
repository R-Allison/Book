package com.yhc.utils;
import javax.servlet.jsp.*;

import javax.servlet.jsp.tagext.*;

import java.util.*;
import java.io.*;

/**
 * 项目名称: BookStore
 * 类名称: GreetingAttributeTagHandler
 * 类描述: 定制标签处理类，用于显示后台登录问候语
 * 创建人: 邵茂仁
 * 修改人: snail
 * 修改时间: 2017年12月23日 下午10:12:57
 * 修改备注: 
 * @version 1.0.0
 */
public class GreetingAttributeTagHandler extends TagSupport {
	// 标签有一个属性：name
	private String name;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
//补充代码
	public int  doStartTag() throws JspTagException {
		Calendar calendar = Calendar.getInstance();
		int hr = calendar.get(Calendar.HOUR_OF_DAY);
		int min = calendar.get(Calendar.MINUTE);
		int sec = calendar.get(Calendar.SECOND);
		String showtime = "~";
		try {
			if (hr < 12) {
				pageContext.getOut().write("Good monrning," + getName()+showtime);
			} else if (hr < 16) {
				pageContext.getOut().write("Good afternoon," + getName()+showtime);
			} else if (hr < 19) {
				pageContext.getOut().write("Good evening," + getName()+showtime);
			} else {
				pageContext.getOut().write("Good night," + getName()+showtime);
			}
		} catch (IOException e) {
			throw new JspTagException(
					"Fatal error:greeeting tag could not write to the output stream.");
		}
		//return EVAL_BODY_INCLUDE;
		return SKIP_BODY;
	}
//补充所缺的方法
	public int doEndTag() throws JspTagException {
		return EVAL_PAGE;
	}

}
