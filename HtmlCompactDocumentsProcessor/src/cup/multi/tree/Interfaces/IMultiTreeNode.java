package cup.multi.tree.Interfaces;

import cup.multi.tree.MultiTreeNode;

public interface IMultiTreeNode {
	MultiTreeNode addChildNode(String childData);
	MultiTreeNode[] getChildren();
	String getData();
	void setData(String data);
	void printNode();
}
