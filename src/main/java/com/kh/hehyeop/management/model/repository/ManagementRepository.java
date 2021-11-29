package com.kh.hehyeop.management.model.repository;

import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.kh.hehyeop.management.model.dto.Icebox;
import org.apache.ibatis.annotations.Update;
import com.kh.hehyeop.management.model.dto.ShoppingList;
import com.kh.hehyeop.management.validator.FixedForm;
import com.kh.hehyeop.management.validator.PersonalForm;

@Mapper
public interface ManagementRepository {

	@Select("select v.*, floor(EX_DATE - sysdate) res_day from icebox v where id = #{id} and category=#{category} and floor(EX_DATE - sysdate) > 3 order by ex_date")
	List<Icebox> selectIceboxUpList(@Param("id")String id, @Param("category") String category);

	@Select("select v.*, floor(EX_DATE - sysdate) res_day from icebox v where id = #{id} and category=#{category} and floor(EX_DATE - sysdate) <= 3 order by ex_date")
	List<Icebox> selectIceboxDownList(@Param("id")String id, @Param("category") String category);

	@Select("select * from shopping_list where id = #{id} and status = 1")
	List<ShoppingList> selectPurchaseListById(@Param("id") String id);
	
	@Select("select * from shopping_list where id = #{id} and status = 0")
	List<ShoppingList> selectExhaustListById(@Param("id") String id);

	@Delete("delete from shopping_list where shopping_idx = #{shoppingIdx}")
	int deleteItemByShoppingIdx(@Param("shoppingIdx") String shoppingIdx);

	@Insert("insert into shopping_list(shopping_idx, id, item, status) values(sc_shopping_idx.nextval, #{id}, #{item}, 1)")
	int insertInputItem(@Param("id") String id, @Param("item") String item);

	@Update("update shopping_list set status = 1 where id = #{id} and shopping_idx = #{shoppingIdx}")
	int updateItemStatus(@Param("id") String id, @Param("shoppingIdx") String shoppingIdx);

	@Insert("insert into expense values(sc_expense_idx.nextval, #{form.category}, #{id}, #{form.content}, #{form.price}, #{form.expDate})")
	void insertPersonalSpend(@Param("id")String id, @Param("form") PersonalForm form);

	@Insert("insert into f_expense values(sc_f_expense_idx.nextval, #{id}, #{form.content}, #{form.price}, #{form.days}, #{form.cycle}, #{form.startDate}, #{form.endDate})")
	void insertFixedSpend(@Param("id")String id, @Param("form")FixedForm form);

}
