package com.yhc.utils;

import java.util.Arrays;

/**
 * ��Ŀ����: week15
 * ������: PublicClass
 * ������: �����࣬���һЩ����ʹ�õķ���
 * ������: ��ï��
 * �޸���: snail
 * �޸�ʱ��: 2017��12��23�� ����2:57:50
 * �޸ı�ע: 
 * @version 1.0.0
 */
public class PublicClass {
	/**
	* @Title: useList
	* @Description: �ж��������Ƿ����ָ����ֵ
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
