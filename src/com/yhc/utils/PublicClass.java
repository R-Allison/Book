package com.yhc.utils;

import java.util.Arrays;

/**
 * 项目名称: week15
 * 类名称: PublicClass
 * 类描述: 公共类，存放一些公共使用的方法
 * 创建人: 邵茂仁
 * 修改人: snail
 * 修改时间: 2017年12月23日 下午2:57:50
 * 修改备注: 
 * @version 1.0.0
 */
public class PublicClass {
	/**
	* @Title: useList
	* @Description: 判断数组中是否存在指定的值
	* @param @param arr
	* @param @param targetValue
	* @param @return boolean   
	* @return boolean   
	* @throws
	 */
	public static boolean isInArray(String[] arr, String targetValue) {
        return Arrays.asList(arr).contains(targetValue);
    }
}
