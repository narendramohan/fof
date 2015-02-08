package com.fof.spring.controller;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fof.spring.model.File;
import com.fof.spring.validator.FileValidator;

@Controller
public class FileUploadController {

    
    public @ResponseBody String provideUploadInfo() {
        return "You can upload a file by posting to this same URL.";
    }

    
    public @ResponseBody String handleFileUpload(HttpServletRequest request){
        /*if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                BufferedOutputStream stream =
                        new BufferedOutputStream(new FileOutputStream(new File(name + "-uploaded")));
                stream.write(bytes);
                stream.close();
                return "You successfully uploaded " + name + " into " + name + "-uploaded !";
            } catch (Exception e) {
                return "You failed to upload " + name + " => " + e.getMessage();
            }
        } else {
            return "You failed to upload " + name + " because the file was empty.";
        }*/
    	request.getParameter("name");
    	return "true";
    }
    @Autowired
	FileValidator validator;

	@InitBinder
	private void initBinder(WebDataBinder binder) {
		binder.setValidator(validator);
	}

	@RequestMapping(value="/upload", method=RequestMethod.GET)
	public String getForm(Model model) {
		File fileModel = new File();
		model.addAttribute("file", fileModel);
		return "file";
	}

	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public String fileUploaded(Model model, @Validated File file,
			BindingResult result, HttpServletRequest request) {

		String returnVal = "successFile";
		if (result.hasErrors()) {
			returnVal = "file";
		} else {			
			MultipartFile multipartFile = file.getFile();
		}
		return returnVal;
	}
}