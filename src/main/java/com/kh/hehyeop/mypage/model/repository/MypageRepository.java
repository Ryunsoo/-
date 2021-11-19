package com.kh.hehyeop.mypage.model.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.mypage.model.dto.Location;
import com.kh.hehyeop.mypage.model.dto.Token;
import com.kh.hehyeop.mypage.model.dto.Wallet;
import com.kh.hehyeop.mypage.validator.JoinForm;

@Mapper
public interface MypageRepository {

   @Select("select * from push_token where id = #{userId}")
   Token selectPushTokensById(String userId);

   void insertToken(Map<String, Object> tokenMap);

   void deleteToken(Map<String, Object> tokenMap);

   List<Token> selectPushTokensByManyId(List<String> userIdList);
   
   @Update("update member set is_leave = 1 where id = #{id} and password = #{password}")
	void deleterUser(Member member);
   
   @Update("update wallet set bank = #{bank}, bank_num = #{bankNum}, auth_token = #{authToken}, user_seq = #{userSeq} where id = #{id}")
   void updateWalletInfo(Wallet wallet);
   
   @Select("select * from wallet where id = #{id}")
   Wallet selectWallet(String id);

   @Select("select * from member where email = #{email} and is_leave = 0")
   Member selectMemberByEmail(@Param("email") String email);

   @Update("update member set password = #{password}, name = #{name}, tell = #{tell}, email = #{email}, nickname = #{nickname}, address = #{address}, old_address = #{oldAddress} where id = #{id}")
   void updateInfo(JoinForm form);

   @Select("select * from member where id = #{id} and is_leave = 0")
   Member authenticateUser(Member member);
   
   @Update("update wallet set cash = cash + #{cash} where id = #{id}")
   void insertCash(Wallet chargeWallet);

   @Update("update wallet set cash = #{cash} where id = #{id}")
   void updateCash(Wallet wallet);
   
   @Select("select distinct city from location where major_key= #{majorKey} order by city")
   List<Location> selectLocationCityList(Location location);
   
   @Select("select distinct town from location where city = #{city} order by town")
   List<Location> selectLocationTownList(Location location);
   
}