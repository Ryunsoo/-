package com.kh.hehyeop.common.mybatis;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import oracle.sql.ARRAY;
import oracle.sql.ArrayDescriptor;

public class ReviewTypeHandler extends BaseTypeHandler {

	@Override
	public void setNonNullParameter(PreparedStatement ps, int i, Object parameter, JdbcType jdbcType)
			throws SQLException {

		ArrayDescriptor descriptor = ArrayDescriptor.createDescriptor("REVIEW_ARRAY", ps.getConnection());

		String[] reviews = (String[]) parameter;
		ARRAY reviewArr = new ARRAY(descriptor, ps.getConnection(), reviews);
		ps.setArray(i, reviewArr);
	}

	@Override
	public String getNullableResult(ResultSet rs, String columnName) throws SQLException {
		return rs.getString(columnName);
	}

	@Override
	public String getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
		return rs.getString(columnIndex);
	}

	@Override
	public String getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
		return cs.getString(columnIndex);
	}

}
