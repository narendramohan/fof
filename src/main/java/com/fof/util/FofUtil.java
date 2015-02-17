package com.fof.util;

import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import javax.annotation.Resource;

import com.fof.spring.model.Friend;
import com.fof.spring.model.Product;
import com.fof.spring.model.User;
import com.fof.spring.service.OrderService;
import com.fof.spring.service.ProductService;
import com.fof.spring.service.ReviewService;
import com.fof.spring.service.UserService;

public class FofUtil {
	
	@Resource(name = "userService")
	static UserService userService;
	
	@Resource(name ="reviewService")
	static ReviewService reviewService;
	
	@Resource(name ="orderService")
	static OrderService orderService;
	
	@Resource(name ="productService")
	static ProductService productService;
	
	static Map<String, Map<String, Set<String>>>  round = new HashMap<String, Map<String, Set<String>>>();
	
	/*
	 * 
	 * Algorithm 1 Randomized Detection Algorithm at Round t for
		Detector i
		1: Estimate the type of the purchased product Pjt ;
		2: Differentiate neighbors by determining NC
		i (t), NW
		i (t), and
		NN
		i (t);
		3: Let D(t) ← NW
		i (t) ∩ NN
		i (t);
		4: if Ti (Pjt ) = 1 then
		5: with probability p: Si (t) ← Si (t − 1) ∩ D(t);
		6: with probability 1 − p: Si (t) ←Si (t − 1);
		7: else
		8: Si (t) ← Si (t − 1);
		9: end if
	 */	
	public static Set<String> randomizedDetection(int timeProceedsinRound, String user, String product){
		Set<String> suspiciousUsers = new TreeSet<String>();
		Map<String, Set<String>> rMap=round.get(user);
		Set<String> dishonestUsers;
		Set<String> correctUsers;
		Set<String> notReccomendedUsers;
		if(rMap==null){
			dishonestUsers = new TreeSet<String>();
			correctUsers = new TreeSet<String>();
			notReccomendedUsers = new TreeSet<String>();
			rMap = new HashMap<String, Set<String>>();
			rMap.put("dishonestUsers", dishonestUsers);
			rMap.put("correctUsers", correctUsers);
			rMap.put("notReccomendedUsers", notReccomendedUsers);
		}
		
		dishonestUsers = rMap.get("dishonestUsers");
		correctUsers = rMap.get("correctUsers");
		notReccomendedUsers = rMap.get("notReccomendedUsers");
		Set<String> reviewedUsers = reviewService.getAllUsersReviewed(Integer.parseInt(product));
		List<Friend> friends = userService.friends(user);
		for(String usr:reviewedUsers){
			if(friends.contains(usr)) {
				boolean honest= orderService.hasUserHasOrdered(usr);
				if(honest){
					correctUsers.add(usr);
				} else { 
					dishonestUsers.add(usr);
				}
			} else {
				notReccomendedUsers.add(usr);
			}
		}
		suspiciousUsers = intersection(correctUsers, union(dishonestUsers, notReccomendedUsers));
		return suspiciousUsers;
	}
	/*
	 * Algorithm 2 Complete Detection Algorithm
		1: t ← 0;
		2: Si (0) ← Ni ;
		3: repeat
		4: t ←t + 1;
		5: Derive the suspicious set Si (t) at round t by executing
		Algorithm 1;
		6: Update probability of false positive Pf p(t);
		7: until Pf p(t) ≤ P∗
		f p
		8: Take users in Si (t) as dishonest and blacklist them;
	 */
	public static boolean completeDetection(int timeProceedsinRound, User user){
		Map<String, Set<String>> rMap=round.get(user);
		Set<String> dishonestUsers;
		Set<String> correctUsers;
		Set<String> notReccomendedUsers;
		if(rMap==null){
			dishonestUsers = new TreeSet<String>();
			correctUsers = new TreeSet<String>();
			notReccomendedUsers = new TreeSet<String>();
			rMap = new HashMap<String, Set<String>>();
			rMap.put("dishonestUsers", dishonestUsers);
			rMap.put("correctUsers", correctUsers);
			rMap.put("notReccomendedUsers", notReccomendedUsers);
		}
		
		dishonestUsers = rMap.get("dishonestUsers");
		correctUsers = rMap.get("correctUsers");
		notReccomendedUsers = rMap.get("notReccomendedUsers");
		List<Product> products = productService.getAllProduct();
		for(Product product:products){
			Set<String> reviewedUsers = reviewService.getAllUsersReviewed(product.getProductid());
			for(String usr:reviewedUsers){
				
			}
		}
		return true;
	}
	
	/*
	 * Algorithm 3 Cooperative Detection Algorithm at Round t for
		Detector i
		1: Derive the suspicious set Si (t) based on local information
		(i.e., using Algorithm 1);
		2: Exchange detection results with neighbors;
		3: for each neighbor j ∈ Ni do
		4: with probability wi j (t): Si (t) ←Si (t)\(Nj \Sj (t));
		5: with probability 1 − wi j (t): Si (t) ←Si (t);
		6: end for
	 */
	public static boolean cooperativeDetection(int timeProceedsinRound, String user){
		Set<String> suspiciousUsers = new TreeSet<String>();
		Map<String, Set<String>> rMap=round.get(user);
		Set<String> dishonestUsers;
		Set<String> correctUsers;
		Set<String> notReccomendedUsers;
		if(rMap==null){
			dishonestUsers = new TreeSet<String>();
			correctUsers = new TreeSet<String>();
			notReccomendedUsers = new TreeSet<String>();
			rMap = new HashMap<String, Set<String>>();
			rMap.put("dishonestUsers", dishonestUsers);
			rMap.put("correctUsers", correctUsers);
			rMap.put("notReccomendedUsers", notReccomendedUsers);
		}
		
		dishonestUsers = rMap.get("dishonestUsers");
		correctUsers = rMap.get("correctUsers");
		notReccomendedUsers = rMap.get("notReccomendedUsers");
		Set<String> reviewedUsers = reviewService.getAllUsersReviewed(Integer.parseInt(""));
		for(String usr:reviewedUsers){
			
		}
		List<Friend> friends = userService.friends(user);
		//return suspiciousUsers;
		return true;
	}
	
	public static <T> Set<T> union(Set<T> setA, Set<T> setB) {
	    Set<T> tmp = new TreeSet<T>(setA);
	    tmp.addAll(setB);
	    return tmp;
	  }

	  public static <T> Set<T> intersection(Set<T> setA, Set<T> setB) {
	    Set<T> tmp = new TreeSet<T>();
	    for (T x : setA)
	      if (setB.contains(x))
	        tmp.add(x);
	    return tmp;
	  }

	  public static <T> Set<T> difference(Set<T> setA, Set<T> setB) {
	    Set<T> tmp = new TreeSet<T>(setA);
	    tmp.removeAll(setB);
	    return tmp;
	  }

	  public static <T> Set<T> symDifference(Set<T> setA, Set<T> setB) {
	    Set<T> tmpA;
	    Set<T> tmpB;

	    tmpA = union(setA, setB);
	    tmpB = intersection(setA, setB);
	    return difference(tmpA, tmpB);
	  }

	  public static <T> boolean isSubset(Set<T> setA, Set<T> setB) {
	    return setB.containsAll(setA);
	  }

	  public static <T> boolean isSuperset(Set<T> setA, Set<T> setB) {
	    return setA.containsAll(setB);
	  }

}
