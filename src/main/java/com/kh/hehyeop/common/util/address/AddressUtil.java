package com.kh.hehyeop.common.util.address;

public class AddressUtil {

	public String trimOldAddress(String oldAddress) {
		String[] arr = oldAddress.split(" ");
		String trimAddress = "";

		for (int i = 0; i < arr.length; i++) {
			int lastIdx = arr[i].length() - 1;
			String lastChar = arr[i].substring(lastIdx);

			if (lastChar.equals("동") || lastChar.equals("읍") || lastChar.equals("면")) {
				trimAddress += arr[i];
				break;
			}
			trimAddress += arr[i] + " ";
		}
		return trimAddress;
	}
}
