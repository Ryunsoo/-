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
	
	public String getDoSiAddress(String oldAddress) {
		//도/시 or 시/구로 자르기
		String[] arr = oldAddress.split(" ");
		String doSi = "";
		
		for (int i = 0; i < arr.length; i++) {
			if(i == 1) {
				int lastIdx = arr[i].length() - 1;
				doSi += arr[i].substring(0, lastIdx);
				break;
			}
			doSi += arr[i] + " ";
		}
		return doSi;
	}
}
