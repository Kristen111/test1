package com.aistar.controller.note;

import com.aistar.entity.Note;
import com.aistar.service.NoteService;
import com.aistar.service.impl.NoteServiceImpl;
import com.aistar.util.DateUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet(name = "AddServlet",urlPatterns = "/note/add")
public class AddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String noteTripDate=request.getParameter("noteTripDate"); //出发时间
        String noteTripDays=request.getParameter("noteTripDays"); //出行天数
        String noteTripPartner=request.getParameter("noteTripPartner"); //同行人
        String noteTripFeePerPeople=request.getParameter("noteTripFeePerPeople"); //人均消费

        String noteHeadImg=request.getParameter("noteHeadImg");//游记头图
        String noteTitle=request.getParameter("noteTitle");//游记标题
        String noteContent=request.getParameter("noteContent");//游记内容
        int len =  noteContent.length();
        System.out.print("len:"+ noteContent.length());

        Note note = new Note();
        if(noteTripDate !=null || !noteTripDate.equals(""))
            note.setNoteTripDate(DateUtil.stringToDate(noteTripDate,DateUtil.DATE_PATTERN));
      // if(noteTripDays !=null || !noteTripDays.equals(""))
       //     note.setNoteTripDays(noteTripDays);
        if(noteTripPartner !=null || !noteTripPartner.equals(""))
            note.setNoteTripPartner(Integer.valueOf(noteTripPartner));
        if(noteTripFeePerPeople !=null || !noteTripFeePerPeople.equals(""))
            note.setNoteTripFeePerPeople(Float.valueOf(noteTripFeePerPeople));

        note.setNoteHeadImg(noteHeadImg);
        note.setNoteTitle(noteTitle);
        note.setNoteContent(noteContent);
        int custId = (int)request.getSession().getAttribute("loginCustId");
        note.setCustId(custId);
     //   note.setNoteCharCount(len);

        note.setNoteCreateTime(new Date());

        System.out.println("note:"+note);

        //1.获得编辑器中文字的总量与图片个数


        //service

        NoteService service = new  NoteServiceImpl();
        boolean flag = service.save(note);
        if(flag) {
            //跳转到查看这篇游记/我的游记列表 GetNoteServlet  : select ...where 最近的添加时间
            System.out.print("添加游记成功，跳转到查看这篇游记");
        }else{
            System.out.print("添加游记失败");
            request.setAttribute("msg","添加失败");
            request.getRequestDispatcher("/note/add.jsp").forward(request,response);
        }





    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
