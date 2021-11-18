package com.kh.hehyeop.mypage.model.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.member.validator.JoinForm;
import com.kh.hehyeop.mypage.model.dto.Token;
import com.kh.hehyeop.mypage.model.dto.Wallet;

@Mapper
public interface MypageRepository {

   @Select("select * from push_token where id = #{userId}")
   Token selectPushTokensById(String userId);

   void insertToken(Map<String, Object> tokenMap);

   void deleteToken(Map<String, Object> tokenMap);

   List<Token> selectPushTokensByManyId(List<String> userIdList);
   
   @Update("update member set is_leave = 1 where id = #{id} and password = #{password}")
	void deleterUser(Member member);
   
   @Update("update wallet set bank = #{bank}, bank_num = #{bankNum} where id = #{id}")
   void updateWalletInfo(@Param("id") String id, @Param("bank") String bank, @Param("bankNum") String bankNum);
   
   @Select("select * from wallet where id = #{id}")
   Wallet selectWallet(String id);

   @Select("select * from member where email = #{email} and is_leave = 0")
   Member selectMemberByEmail(@Param("email") String email);

   @Update("update member set password = #{password}, name = #{name}, tell = #{tell}, email = #{email}, nickname = #{nickname}, address = #{address}, old_address = #{oldAddress} where id = #{id}")
   void updateInfo(JoinForm form);
   
   @Update("update wallet set cash = cash + #{cash} where id = #{id}")
   void insertCash(Wallet chargeWallet);
   

   
}