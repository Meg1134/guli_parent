package com.atguigu.guli.service.cms.entity.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author msl
 * @since 2022/4/28
 */
@Data
public class AdVo implements Serializable {

    private static final long serialVersionUID=1L;
    private String id;
    private String title;//广告标题
    private Integer sort;//广告排序
    private String type; //广告位
}