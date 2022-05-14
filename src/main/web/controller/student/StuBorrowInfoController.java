package main.web.controller.student;

import main.constant.Constant;
import main.dao.BookStudentDao;
import main.dao.SettingDao;
import main.dao.StudentDao;
import main.dao.BookDao;
import main.dao.domain.Book;
import main.dao.domain.BookStudent;
import main.dao.domain.Setting;
import main.dao.domain.Student;
import main.util.DateUtils;
import main.web.bean.PageBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/student/borrowInfo")
public class StuBorrowInfoController {

    @Resource
    private BookStudentDao bookStudentDao;

    @Resource
    private BookDao bookDao;
    
    @Resource
    private StudentDao studentDao;
    
    @Resource
    private SettingDao settingDao;


    @RequestMapping(method = {RequestMethod.GET, RequestMethod.POST})
    public String index(HttpServletRequest request, ModelMap model) {
        String username = (String) request.getSession().getAttribute(Constant.user_name);
        model.addAttribute("username", username);
        return "student/borrow-info";
    }



    @ResponseBody
    @RequestMapping(value = "/list", method = {RequestMethod.GET, RequestMethod.POST})
    public PageBean<BookStudent> list(HttpServletRequest request, ModelMap model, BookStudent bookStudent) {
        Integer sid = (Integer) request.getSession().getAttribute(Constant.user_id);
        bookStudent.setSid(sid);
        List<BookStudent> bookStudents = bookStudentDao.find(bookStudent);
        PageBean<BookStudent> data = new PageBean<BookStudent>();
        data.setData(bookStudents);
        return data;
    }


    @ResponseBody
    @RequestMapping(value = "/findBook", method = {RequestMethod.GET, RequestMethod.POST})
    public Book findBook(Book book){
        return bookDao.findByBno(book);
    }
    
    @ResponseBody
    @RequestMapping(value = "/saveReturn", method = {RequestMethod.GET, RequestMethod.POST})
    public int saveReturn(HttpServletRequest request,ModelMap model, BookStudent bookStudent) {
    	String sno = (String) request.getSession().getAttribute(Constant.student_login_session_name);
//    	System.out.print(sno);
    	bookStudent.setSno(sno);
        Student student = new Student();
        student.setSno(bookStudent.getSno());
        student = studentDao.findBySno(student);
        if (student == null) {
            return -1;
        }

        Book book = new Book();
        book.setBno(bookStudent.getBno());
        book = bookDao.findByBno(book);
        if (book == null) {
            return -2;
        }

        BookStudent bs1 = new BookStudent();
        bs1.setSid(student.getId());
        bs1.setBid(book.getId());
        List<BookStudent> bss1 = bookStudentDao.find(bs1);
        if (CollectionUtils.isEmpty(bss1)) {
            return -3;
        }

        bookStudent.setSid(student.getId());
        bookStudent.setBid(book.getId());
        boolean rs1 = bookStudentDao.delete(bookStudent);

        Book b = new Book();
        b.setId(book.getId());
        b.setRemain(book.getRemain() + 1);
        boolean rs2 = bookDao.updateRemain(b);


        return rs1 && rs2 ? 1 : 0;
    }
    
    
    @ResponseBody
    @RequestMapping(value = "/saveXj", method = {RequestMethod.GET, RequestMethod.POST})
    public int saveXj(HttpServletRequest request,ModelMap model, BookStudent bookStudent) {
    	//续借-就是还书-借书
    	saveReturn(request,model,bookStudent);
    	String sno = (String) request.getSession().getAttribute(Constant.student_login_session_name);
//    	System.out.print(sno);
    	bookStudent.setSno(sno);
    	Student student = new Student();
        student.setSno(bookStudent.getSno());
        student = studentDao.findBySno(student);
        if (student == null) {
            return -1;
        }

        Book book = new Book();
        book.setBno(bookStudent.getBno());
        book = bookDao.findByBno(book);
        if (book == null) {
            return -2;
        }

        if (book.getRemain() <= 0) {
            return -3;
        }

        BookStudent bs1 = new BookStudent();
        bs1.setSid(student.getId());
        bs1.setBid(book.getId());
        List<BookStudent> bss1 = bookStudentDao.find(bs1);
        if (!CollectionUtils.isEmpty(bss1)) {
            return -4;
        }


        Setting setting1 = new Setting();
        setting1.setId(Constant.keep_book_max_amount_id);
        setting1 = settingDao.findById(setting1);

        BookStudent bs2 = new BookStudent();
        bs2.setSid(student.getId());
        List<BookStudent> bss2 = bookStudentDao.find(bs2);
        if (!CollectionUtils.isEmpty(bss2) && bss2.size() > setting1.getValue()) {
            return -5;
        }

        Setting setting2 = new Setting();
        setting2.setId(Constant.keep_book_max_days_id);
        setting2 = settingDao.findById(setting2);

        bookStudent.setSid(student.getId());
        bookStudent.setBid(book.getId());
        bookStudent.setBdate(new Date());
        bookStudent.setRdate(DateUtils.addDay(new Date(), setting2.getValue()));
        boolean rs1 = bookStudentDao.save(bookStudent);

        Book b = new Book();
        b.setId(book.getId());
        b.setRemain(book.getRemain() - 1);
        boolean rs2 = bookDao.updateRemain(b);

        return rs1 && rs2 ? 1 : 0;
    }
}