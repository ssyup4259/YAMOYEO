package yamoyeo;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;

@org.springframework.stereotype.Controller
public class GroupSearchController {

	@RequestMapping(value = "groupSearch.do")
	public void searchGroup(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Parameter
		HttpSession session = request.getSession();
		String group_id = request.getParameter("group_id");
		String user_id = (String) session.getAttribute("user_id");
		System.out.println(user_id);
		ArrayList<CommentVO> list = null;
		// Service
		Service service = Service.getInstance();
		GroupVO group = service.searchGroup(group_id);
		int join_state = service.searchJoin(group_id, user_id);
		System.out.println(join_state);
		// Output View
		request.setAttribute("detailImg", "groupImg/" + group.getImage());
		System.out.println(request.getAttribute("detailImg"));
		request.setAttribute("group", group);
		request.setAttribute("join_state", join_state);

		list = service.getComment(request.getParameter("group_id"));
		for (int i = 0; i < list.size(); i++) {
			request.setAttribute("comment" + i, list.get(i));
		}

		HttpUtil.forward(request, response, "/view04_d.jsp");
	}

	@RequestMapping(value = "searchGroup.do")
	public void groupSearch(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("searchGroup.do 해서 들어왔나");
		String interest = request.getParameter("interest");
		String address = request.getParameter("address");
		String day = request.getParameter("day");

		System.out.println("받아온 관심사, 지역, 요일 = " + interest + ", " + address + ", " + day);
		Service service = Service.getInstance();
		ArrayList<GroupVO> list = service.groupSearch(interest, address, day);
		for (int i = 0; i < list.size(); i++) {
			request.setAttribute("searchgroup" + i, list.get(i));
			request.setAttribute("searchImg"+i,"groupImg/"+list.get(i).getImage());
		}
		HttpUtil.forward(request, response, "/view03_d.jsp");
	}

	@RequestMapping(value = "searchGroupName.do")
	public void groupSearchName(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("searchGroupName.do 해서 들어왔나");
		String group_name = request.getParameter("group_name");

		System.out.println("받아온 그룹 이름 = " + group_name);
		Service service = Service.getInstance();
		ArrayList<GroupVO> list = service.groupSearchName(group_name);
		for (int i = 0; i < list.size(); i++) {
			request.setAttribute("searchgroup" + i, list.get(i));
			request.setAttribute("searchImg"+i,"groupImg/"+list.get(i).getImage());
		}
		HttpUtil.forward(request, response, "/view03_d.jsp");
	}
	
	@RequestMapping(value = "searchMygroup.do")
	public String searchMygroup(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("searchMygroup에 안드러왔니?");
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		ArrayList<GroupVO> list = null;
		Service service = Service.getInstance();
		System.out.println("찾으러 갑니다");
		list = service.searchMygroup(user_id);

		for (int i = 0; i < list.size(); i++) {
			request.setAttribute("mygroup" + i, list.get(i));
			System.out.println("지우고 난 후 mygroup들 = " + list.get(i));
		}
		System.out.println("뷰8 가기전");
		return "view08_d";
	}

}
