package com.fof.util;

public class FofUtil {
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
	public static boolean randomizedDetection(int timeProceedsinRound, String user){

		return true;
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
	public static boolean completeDetection(int timeProceedsinRound, String user){
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
		return true;
	}
}
