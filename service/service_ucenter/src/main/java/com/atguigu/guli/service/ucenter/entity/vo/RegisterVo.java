package com.atguigu.guli.service.ucenter.entity.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author msl
 * @since 2022/4/29
 */
@Data
public class RegisterVo implements Serializable {
    private static final long serialVersionUID = 1L;
    private String nickname;
    private String mobile;
    private String password;
    private String code;
}