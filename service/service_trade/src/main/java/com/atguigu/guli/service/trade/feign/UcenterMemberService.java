package com.atguigu.guli.service.trade.feign;

import com.atguigu.guli.service.base.dto.MemberDto;
import com.atguigu.guli.service.trade.feign.fallback.UcenterMemberServiceFallback;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

/**
 * @author msl
 * @since 2022/5/5
 */
@Service
@FeignClient(value = "service-ucenter", fallback = UcenterMemberServiceFallback.class)
public interface UcenterMemberService {

    @GetMapping("/api/ucenter/member/inner/get-member-dto/{memberId}")
    MemberDto getMemberDtoByMemberId(@PathVariable(value = "memberId") String memberId);
}
