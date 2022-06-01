package com.atguigu.guli.service.trade.service;

import java.util.Map;

/**
 * @author msl
 * @since 2022/5/6
 */
public interface WeixinPayService {

    Map<String, Object> createNative(String orderNo, String remoteAddr);
}
