package com.kh.hehyeop.help.model.service;

import java.util.List;
import org.springframework.web.multipart.MultipartFile;
import com.kh.hehyeop.help.model.dto.HelpRequest;

public interface HelpService {

	int insertRequest(HelpRequest helpRequest);

	String selectReqIdx(String id);

	int uploadFile(List<MultipartFile> files, String reqIdx);

}
