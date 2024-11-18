package cup.multi.tree.Interfaces;

import cup.multi.tree.MultiTreeNode;

public interface IMultiTree {
	MultiTreeNode addChildNode(IMultiTreeNode parentNode, String childData);
	MultiTreeNode createTree(String rootData) throws Exception;
	void printTree();
}
