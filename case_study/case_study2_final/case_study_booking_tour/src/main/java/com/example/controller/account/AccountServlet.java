package com.example.controller.account;


import com.example.model.account.Account;
import com.example.model.account.Email;
import com.example.service.account.AccountService;
import com.example.service.account.IAccountService;
import com.example.model.account.Role;

import com.example.service.account.IRoleService;
import com.example.service.account.RoleService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@WebServlet(name = "AccountServlet", value = "/account")
public class AccountServlet extends HttpServlet {
    IAccountService service = new AccountService();
    IRoleService roleService = new RoleService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "signup":
                showSignUp(request, response);
                break;
            case "login":
                showLogin(request, response);
                break;
            case "home":
                showMenu(request, response);
                break;
            case "logout":
                logout(request, response);
                break;
            case "manage":
                showManage(request, response);
                break;
            case "edit":
                showEdit(request, response);
                break;
            case "create":
                showCreate(request, response);
                break;
            case "reset":
                showReset(request, response);
                break;
            default:
                showList(request, response);
        }
    }




    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "signup":
                signUp(request, response);
                break;
            case "login":
                loginUser(request, response);
                break;
            case "edit":
                editAccount(request, response);
                break;
            case "create":
                createAccount(request, response);
                break;
            case "delete":
                deleteAccount(request, response);
                break;
            case "reset":
                resetPassWord(request, response);
                break;
            default:

        }
    }

    private void showReset(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("views/account/reset.jsp");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    private void resetPassWord(HttpServletRequest request, HttpServletResponse response) {
        String email = request.getParameter("email");
        Account account = service.getAllByEmail().get(email);
        try {
            if (account == null) {
                request.setAttribute("message", "Email không tồn tại!");
                request.getRequestDispatcher("views/account/reset.jsp").forward(request, response);
            } else {
                String newPassWord = String.valueOf((int) (Math.random() * 9999));

                String content = " <html lang=\"en\">\n" +
                        "<head>\n" +
                        "    <meta charset=\"UTF-8\">\n" +
                        "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                        "    <link rel=\"stylesheet\" href=\"styles.css\">\n" +
                        "    <title>Forgot Password</title>\n" +
                        "</head>\n" +
                        "<body>\n" +
                        "<tbody>\n" +
                        "<tr height=\"16\"  ></tr>\n" +
                        "<tr>\n" +
                        "    <td>\n" +
                        "        <table bgcolor=\"#4184F3\" width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"\n" +
                        "               style=\"min-width:332px;max-width:600px;border:1px solid #e0e0e0;border-bottom:0;border-top-left-radius:3px;border-top-right-radius:3px\">\n" +
                        "            <tbody>\n" +
                        "            <tr>\n" +
                        "                <td height=\"72px\" colspan=\"3\" style=\"background-color: #ff5b00\"></td>\n" +
                        "            </tr>\n" +
                        "            <tr>\n" +
                        "                <td width=\"32px\" style=\"background-color: #ff5b00\"></td>\n" +
                        "                <td style=\"font-family:Roboto-Regular,Helvetica,Arial,sans-serif;font-size:24px;color:#ffffff;line-height:1.25;background-color: #ff5b00\">\n" +
                        "                    Mã xác minh Simple Booking\n" +
                        "                </td>\n" +
                        "                <td width=\"32px\" style=\"background-color: #ff5b00\"></td>\n" +
                        "            </tr>\n" +
                        "            <tr style=\"background-color: #ff5b00\">\n" +
                        "                <td height=\"18px\" colspan=\"3\"></td>\n" +
                        "            </tr>\n" +
                        "            </tbody>\n" +
                        "        </table>\n" +
                        "    </td>\n" +
                        "</tr>\n" +
                        "<tr>\n" +
                        "    <td>\n" +
                        "        <table bgcolor=\"#FAFAFA\" width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"\n" +
                        "               style=\"min-width:332px;max-width:600px;border:1px solid #f0f0f0;border-bottom:1px solid #c0c0c0;border-top:0;border-bottom-left-radius:3px;border-bottom-right-radius:3px\">\n" +
                        "            <tbody>\n" +
                        "            <tr height=\"16px\">\n" +
                        "                <td width=\"32px\" rowspan=\"3\"></td>\n" +
                        "                <td></td>\n" +
                        "                <td width=\"32px\" rowspan=\"3\"></td>\n" +
                        "            </tr>\n" +
                        "            <tr>\n" +
                        "                <td><p>Kính gửi người dùng Simple Booking!</p>\n" +
                        "                    <p>Mã xác minh bạn cần dùng để truy cập vào Tài khoản Simple Booking của mình là:</p>\n" +
                        "                    <div style=\"text-align:center\"><p dir=\"ltr\"><strong\n" +
                        "                            style=\"text-align:center;font-size:24px;font-weight:bold\">"+ newPassWord +"</strong></p></div>\n" +
                        "                    <p>Nếu bạn không yêu cầu mã này thì có thể là ai đó đang tìm cách truy cập vào Tài khoản Simple Booing\n" +
                        "                        <strong>Không chuyển tiếp hoặc cung cấp mã này cho bất kỳ ai.</strong></p>\n" +
                        "                    <p> Trân trọng!</p>\n" +
                        "                    <p>Nhóm tài khoản Simple Booking</p></td>\n" +
                        "            </tr>\n" +
                        "            <tr height=\"32px\"></tr>\n" +
                        "            </tbody>\n" +
                        "        </table>\n" +
                        "    </td>\n" +
                        "</tr>\n" +
                        "<tr height=\"16\"></tr>\n" +
                        "<tr>\n" +
                        "    <td style=\"max-width:600px;font-family:Roboto-Regular,Helvetica,Arial,sans-serif;font-size:10px;color:#bcbcbc;line-height:1.5\">\n" +
                        "        <table>\n" +
                        "            <tbody>\n" +
                        "            <tr>\n" +
                        "                <td>\n" +
                        "                    <table style=\"font-family:Roboto-Regular,Helvetica,Arial,sans-serif;font-size:10px;color:#666666;line-height:18px;padding-bottom:10px\">\n" +
                        "                        <tbody>\n" +
                        "                        <tr>\n" +
                        "                            <td>Email này không thể nhận thư trả lời. Để biết thêm thông tin, hãy truy cập <a\n" +
                        "                                    href=\"#\"\n" +
                        "                                    style=\"text-decoration:none;color:#ff5b00\" target=\"_blank\"\n" +
                        "                                    data-saferedirecturl=\"#\">Trung\n" +
                        "                                tâm trợ giúp về Tài khoản Simple</a>.<br>© Google Inc., 1600 Amphitheatre Parkway,\n" +
                        "                                Mountain View, CA 94043, USA\n" +
                        "                            </td>\n" +
                        "                        </tr>\n" +
                        "                        </tbody>\n" +
                        "                    </table>\n" +
                        "                </td>\n" +
                        "            </tr>\n" +
                        "            </tbody>\n" +
                        "        </table>\n" +
                        "    </td>\n" +
                        "</tr>\n" +
                        "</tbody>\n" +
                        "</body>\n" +
                        "</html>";

                int id = account.getId();
                service.resetPassWord(id, newPassWord);
                Email.sendEmail(account.getEmail(), "Simple Booking - Reset Password.", content );
                request.setAttribute("success", "Đã gửi thành công! Hãy kiểm tra email và đăng nhập lại.");
                request.getRequestDispatcher("views/account/login.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }

    }


    private void showLogin(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("views/account/login.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void loginUser(HttpServletRequest request, HttpServletResponse response) {
        String user = request.getParameter("user");
        String password = request.getParameter("password");
        Account account = service.login(user, password);
        try {
            if (account == null) {
                request.setAttribute("user", user);
                request.setAttribute("pass", password);
                request.setAttribute("message", "Sai thông tin tài khoản!");
                request.getRequestDispatcher("views/account/login.jsp").forward(request, response);
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("account", account);
                request.getRequestDispatcher("index.jsp").forward(request,response);
//                response.sendRedirect("home/header.jsp");
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void logout(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        session.removeAttribute("account");
        try {
            response.sendRedirect("index.jsp");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void showSignUp(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("views/account/sign_up.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void signUp(HttpServletRequest request, HttpServletResponse response) {
        String userName = request.getParameter("user");
        String password = request.getParameter("password");
        String repeatPassword = request.getParameter("repeat-password");
        String email = request.getParameter("email");
        try {
            if (userName.equals("") || password.equals("")) {
                request.setAttribute("alert", "Please enter all information!");
                request.getRequestDispatcher("views/account/sign_up.jsp").forward(request, response);
            }
            if (password.equals(repeatPassword)) {
                Account account = service.checkAccount(userName);
                Account account1 = service.findByEmail(email);
                if (account != null) {
                    request.setAttribute("user", userName);
                    request.setAttribute("email", email);
                    request.setAttribute("error", "Tài khoản đã tồn tại!");
                    request.getRequestDispatcher("views/account/sign_up.jsp").forward(request, response);
                } else if (account1!=null){
                    request.setAttribute("user", userName);
                    request.setAttribute("email", email);
                    request.setAttribute("error1", "Email đã được đăng ký!");
                    request.getRequestDispatcher("views/account/sign_up.jsp").forward(request, response);
                }
                else{
                    service.signUp(userName, password, email);
                    request.setAttribute("success", "Đăng ký thành công.");
                    request.getRequestDispatcher("views/account/sign_up.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("user", userName);
                request.setAttribute("email", email);
                request.setAttribute("message", "Xác nhận mật khẩu không đúng!");
                request.getRequestDispatcher("views/account/sign_up.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void showMenu(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("index.jsp");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showManage(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("/statistical.jsp");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Account> accountList = new ArrayList<>(service.getAll().values());
        request.setAttribute("accounts", accountList);
        try {

            request.getRequestDispatcher("views/account/listAccount.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showEdit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Account account = service.findById(id);
        List<Role> role = roleService.getRole();
        try {
            if (account == null) {
                request.getRequestDispatcher("views/account/error.jsp").forward(request, response);
            } else {
                request.setAttribute("newRole", role);
                request.setAttribute("acc", account);
                request.getRequestDispatcher("views/account/edit.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void editAccount(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("code"));
        String userName = request.getParameter("user");
        String passWord = request.getParameter("pass");
        int status = 0;
        int role = Integer.parseInt(request.getParameter("role"));
        String email = request.getParameter("email");

        List<Role> role1 = roleService.getRole();
        Account account = service.findById(id);
        Account account1 = service.findByName(userName);
        Account account2 = service.findByEmail(email);
        try {
            if (account == null) {
                request.getRequestDispatcher("views/account/error.jsp").forward(request, response);
            } else if (account1 != null && !Objects.equals(account1.getUsername(), account.getUsername())) {

                request.setAttribute("newRole", role1);
                request.setAttribute("acc", account);
                request.setAttribute("error", "Tài khoản đã tồn tại!");
                request.getRequestDispatcher("views/edit.jsp").forward(request, response);
            } else if (account2 != null && !account2.getEmail().equals(account.getEmail())){
                request.setAttribute("newRole", role1);
                request.setAttribute("acc", account);
                request.setAttribute("error1", "Email đã được đăng ký!");
                request.getRequestDispatcher("views/account/edit.jsp").forward(request, response);
            }
            else{
                account.setUsername(userName);
                account.setPassword(passWord);
                account.setStatus(status);
                account.setRole(role);
                account.setEmail(email);

                service.editAccount(id, account);
                request.setAttribute("newRole", role1);
                request.setAttribute("acc", account);
                request.setAttribute("message", "Bạn đã cập nhật thành công!");
                request.getRequestDispatcher("views/account/edit.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<Role> role = roleService.getRole();
            request.setAttribute("newRole", role);
            request.getRequestDispatcher("views/account/create.jsp").forward(request, response);
        } catch (IOException | ServletException e) {
            throw new RuntimeException(e);
        }
    }

    private void createAccount(HttpServletRequest request, HttpServletResponse response) {
        String userName = request.getParameter("user");
        String passWord = request.getParameter("pass");
        int status = 0;
        int role = Integer.parseInt(request.getParameter("role"));
        String email = request.getParameter("email");

        Account account = service.findByName(userName);
        Account account1 = service.findByEmail(email);
        List<Role> role1 = roleService.getRole();
        Account account2 = new Account(userName, passWord, status, role ,email);
        try {
            if (account != null) {

                request.setAttribute("newRole", role1);
                request.setAttribute("acc", account2);
                request.setAttribute("error", "Tên tài khoản đã tồn tại!");
                request.getRequestDispatcher("views/account/create.jsp").forward(request, response);
            } else if (account1 != null) {

                request.setAttribute("newRole", role1);
                request.setAttribute("acc", account2);
                request.setAttribute("error1", "Email này đã được đăng ký!");
                request.getRequestDispatcher("views/account/create.jsp").forward(request, response);
            } else {
                Account newAccount = new Account(userName, passWord, status, role, email);
                service.createAcction(newAccount);
                request.setAttribute("newRole", role1);
                request.setAttribute("account", newAccount);
                request.setAttribute("message", "Đăng ký thành công.");
                request.getRequestDispatcher("views/account/create.jsp").forward(request, response);
            }

        } catch (IOException | ServletException e) {
            throw new RuntimeException(e);
        }
    }

    private void deleteAccount(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Account account = service.findById(id);
        try {
            if (account == null) {
                request.getRequestDispatcher("views/account/error.jsp").forward(request, response);
            } else {
                service.deleteAccount(id, true);
                response.sendRedirect("/account");
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }

    }
}