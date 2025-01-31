package com.kh.hehyeop.mypage.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.hehyeop.common.util.file.FileUtil;
import com.kh.hehyeop.member.model.dto.CMember;
import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.member.validator.FieldForm;
import com.kh.hehyeop.mypage.model.dto.Friend;
import com.kh.hehyeop.mypage.model.dto.LinkMember;
import com.kh.hehyeop.mypage.model.dto.Location;
import com.kh.hehyeop.mypage.model.dto.MyAddress;
import com.kh.hehyeop.mypage.model.dto.Token;
import com.kh.hehyeop.mypage.model.dto.Wallet;
import com.kh.hehyeop.mypage.model.repository.MypageRepository;
import com.kh.hehyeop.mypage.validator.JoinForm;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MypageServiceImpl implements MypageService {

	private final MypageRepository mypageRepository;
	private final PasswordEncoder passwordEncoder;

	@Override
	public List<String> getValidTokens(String userId) {
		List<String> validTokens = new ArrayList<String>();

		Token token = mypageRepository.selectPushTokensById(userId);
		if (token.getMobileToken() != null)
			validTokens.add(token.getMobileToken());
		if (token.getPcToken() != null)
			validTokens.add(token.getPcToken());

		return validTokens;
	}

	@Override
	public List<String> getValidTokens(List<String> userIdList) {
		List<String> validTokens = new ArrayList<String>();
		List<Token> tokenList = mypageRepository.selectPushTokensByManyId(userIdList);
		System.out.println(tokenList);

		for (Token token : tokenList) {
			if (token.getMobileToken() != null)
				validTokens.add(token.getMobileToken());
			if (token.getPcToken() != null)
				validTokens.add(token.getPcToken());
		}

		return validTokens;
	}

	@Override
	public void insertToken(String token, String device, String id) {
		mypageRepository.insertToken(Map.of("token", token, "device", device, "id", id));
	}

	@Override
	public void deleteToken(String device, String id) {
		mypageRepository.deleteToken(Map.of("device", device, "id", id));

	}

	@Override
	public void deleterUser(Member member) {
		mypageRepository.deleterUser(member);

	}

	@Override
	public void updateWalletInfo(Wallet wallet) {
		mypageRepository.updateWalletInfo(wallet);
	}

	@Override
	public Wallet selectWallet(String id) {
		return mypageRepository.selectWallet(id);
	}

	@Override
	public Member selectMemberByEmail(String email) {
		return mypageRepository.selectMemberByEmail(email);
	}

	@Override
	public void updateInfo(JoinForm form) {
		form.setPassword(passwordEncoder.encode(form.getPassword()));
		mypageRepository.updateInfo(form);

	}

	@Override
	public void insertCash(Wallet chargeWallet) {
		mypageRepository.insertCash(chargeWallet);
	}

	@Override
	public Member authenticateUser(Member member) {
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		return mypageRepository.authenticateUser(member);
	}

	@Override
	public CMember authenticateCUser(CMember member) {
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		return mypageRepository.authenticateCUser(member);
	}

	@Override
	public List<Location> selectLocationList(Location location) {
		if (location.getMajorKey() != null && location.getCity() == null) {
			return mypageRepository.selectLocationCityList(location);
		}
		if (location.getCity() != null && location.getTown() == null) {
			return mypageRepository.selectLocationTownList(location);
		}
		return null;
	}

	public void updateCash(Wallet wallet) {
		mypageRepository.updateCash(wallet);
	}

	public List<Friend> selectFriend(String id) {
		return mypageRepository.selectFriend(id);
	}

	@Override
	public void updateMemo(String id, String friendId, String memo) {
		mypageRepository.updateMemo(id, friendId, memo);

	}

	@Override
	public void deleteFriend(String id, String friendId) {
		mypageRepository.deleteFriend(id, friendId);

	}

	@Override
	public List<String> selectField(String id) {
		return mypageRepository.selectField(id);
	}

	@Override
	public LinkMember selectLink(String id) {
		return mypageRepository.selectLink(id);
	}

	@Override
	public void updateAddress(Location location, String id) {
		
		String inputAddress = "";
		
		if(location.getCity().equals("세종시")) {
			inputAddress = location.getMajorKey() + " " + location.getTown();
		} else {
			inputAddress = location.getMajorKey() + " " + location.getCity() + " " + location.getTown();
		}

		MyAddress myAddress = mypageRepository.checkMyAddress(id);

		myAddress.setId(id);

		if (myAddress.getAddress2() == null) {
			myAddress.setAddress2(inputAddress);
			mypageRepository.updateAddress2(myAddress);
			return;
		}
		if (myAddress.getAddress2() != null && myAddress.getAddress3() == null) {
			myAddress.setAddress3(inputAddress);
			mypageRepository.updateAddress3(myAddress);
		}
	}

	@Override
	public MyAddress getMypageAddressList(String id) {
		return mypageRepository.getMyPageAddressList(id);
	}

	@Override
	public void removeAddress(String id, String addressNum) {

		if (addressNum.equals("2")) {
			mypageRepository.removeAddress2(id);
			return;
		}
		if (addressNum.equals("3")) {
			mypageRepository.removeAddress3(id);
		}
		return;
	}

	@Override
	public void updateCompanyInfo(JoinForm form) {
		form.setPassword(passwordEncoder.encode(form.getPassword()));
		mypageRepository.updateCompanyInfo(form);
	}

	@Override
	public void updateCompanyField(String id, List<String> fields) {
		mypageRepository.updateCompanyField(id, fields);
		
	}

	@Override
	public void uploadFile(List<MultipartFile> files, String cIdx) {
		FileUtil util = new FileUtil();
		for (MultipartFile multipartFile : files) {
			if(!multipartFile.isEmpty()) {
				mypageRepository.uploadFile(util.fileUpload(multipartFile, cIdx));
			}
		}
		
	}

	@Override
	public List<Integer> selectResponseCnt(String id) {
		List<Integer> responseCntList = new ArrayList<Integer>();
		
		responseCntList.add(mypageRepository.selectAllResponse(id));
		responseCntList.add(mypageRepository.selectCompleteResponse(id));
		
		return responseCntList;
	}
	
	public List<Double> getScore(String id) {
		return mypageRepository.getScore(id);
	}

	@Override
	public List<Map<String, Object>> getReview(String id) {
		return mypageRepository.getReview(id);
	}

	@Override
	public Map<String, String> getPurchaseCount(String id) {
		Map<String, String> purchaseCount = new HashMap<>();
		purchaseCount.put("participationCount", mypageRepository.getParticipationCount(id));
		purchaseCount.put("recruitmentCount", mypageRepository.getRecruitmentCount(id));
		return purchaseCount;
	}

	@Override
	public int selectStatus(String id) {
		return mypageRepository.selectStatus(id);
	}

	@Override
	public ArrayList<FieldForm> selectFieldExceptPermit(String id) {
		return mypageRepository.selectFieldExceptPermit(id);
	}
}
