package cup.multi.tree;

import java.util.ArrayList;

import cup.multi.tree.Interfaces.IMultiTreeNode;

public class MultiTreeNode implements IMultiTreeNode {

	private String data;
	private String extraData;
	private ArrayList<IMultiTreeNode> children;
	
	public MultiTreeNode(String data) {
		this.data = data;
		children = new ArrayList<IMultiTreeNode>();
	}
	
	public MultiTreeNode(String data, String content) {
		this.data = data;
		this.extraData = content;
		children = new ArrayList<IMultiTreeNode>();
	}
	
	public String getData() {
		return data;
	}
	
	public void setData(String data) {
		this.data = data;
	}
	
	public MultiTreeNode[] getChildren() {
		MultiTreeNode[] childrenArray = new MultiTreeNode[children.size()];
		return children.toArray(childrenArray);
	}
	
	public MultiTreeNode addChildNode(String childData) {
		MultiTreeNode addedNode = new MultiTreeNode(childData);
		children.add(addedNode);
		return addedNode;
	}
	
	public void addChildNode(MultiTreeNode childNode) {
		children.add(childNode);
	}
	
	public void printNode() {
		if(extraData != null)
		{
			System.out.println("Node data: " + data + extraData);	
		}
		else 
		{
			System.out.println("Node data: " + data);
		}
		for(IMultiTreeNode multiTreeNode : children) {
			multiTreeNode.printNode();
		}
	}
}
