package com.kh.hehyeop.common.util.address;

public class AddressUtil {

	public String trimOldAddress(String oldAddress) {
		String[] arr = oldAddress.split(" ");
		int targetIdx = 0;
		String trimAddress = "";

		for (int i = 0; i < arr.length; i++) {
			int lastIdx = arr[i].length() - 1;
			String lastChar = arr[i].substring(lastIdx);

			if (lastChar.equals("동") || lastChar.equals("읍") || lastChar.equals("면")) {
				targetIdx = i;
				break;
			}
		}
		
		if(targetIdx < 3) {
			for (int i = 0; i < arr.length; i++) {
				if(i == targetIdx) {
					trimAddress += arr[i];
					break;
				}
				trimAddress += arr[i] + " ";
			}
		}else if(targetIdx == 3){
			for (int i = 0; i < arr.length; i++) {
				if(i == 2) {
					continue;
				}else if(i == targetIdx) {
					trimAddress += arr[i];
					break;
				}
				trimAddress += arr[i] + " ";
			}
		}
		
		return trimAddress;
	}
}
