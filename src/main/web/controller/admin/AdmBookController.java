package main.web.controller.admin;

import main.constant.Constant;
import main.dao.BookTypeDao;
import main.dao.domain.BookType;
import main.dao.BookDao;
import main.dao.domain.Book;
import main.web.bean.PageBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/admin/book")
public class AdmBookController {

    @Resource
    private BookDao bookDao;

    @Resource
    private BookTypeDao bookTypeDao;

    @RequestMapping(method = RequestMethod.GET)
    public String index(HttpServletRequest request, ModelMap model) {
        String username = (String) request.getSession().getAttribute(Constant.user_name);
        List<BookType> bookTypes = bookTypeDao.find(null);
        model.addAttribute("username", username);
        model.addAttribute("bookTypes", bookTypes);
        return "admin/book";
    }

    @ResponseBody
    @RequestMapping(value = "/list", method = {RequestMethod.GET, RequestMethod.POST})
    public PageBean<Book> list(ModelMap model, Book book) {
        List<Book> books = bookDao.find(book);
        PageBean<Book> data = new PageBean<Book>();
        data.setData(books);
        return data;
    }

    @ResponseBody
    @RequestMapping(value = "/findById", method = {RequestMethod.GET, RequestMethod.POST})
    public Book findById(ModelMap model, Book book) {
        return bookDao.findById(book);
    }

    @ResponseBody
    @RequestMapping(value = "/save", method = {RequestMethod.GET, RequestMethod.POST})
    public int save(ModelMap model, Book book) {
        Book b = bookDao.findByBno(book);
        if (b != null) {
            return -1;
        }
        return bookDao.save(book) ? 1 : 0;
    }

    @ResponseBody
    @RequestMapping(value = "/update", method = {RequestMethod.GET, RequestMethod.POST})
    public Boolean update(ModelMap model, Book book) {
        Book b = bookDao.findById(book);
        book.setTotal(b.getTotal() + (book.getRemain() - b.getRemain()));
        return bookDao.update(book);
    }

    @ResponseBody
    @RequestMapping(value = "/delete", method = {RequestMethod.GET, RequestMethod.POST})
    public Boolean delete(ModelMap model, Book book) {
        return bookDao.delete(book);
    }
}