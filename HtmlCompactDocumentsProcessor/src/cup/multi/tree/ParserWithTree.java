package cup.multi.tree;

import cup.example.Parser;

public class ParserWithTree extends Parser {
	public ParserWithTree() {
		super();
	}

	public MultiTreeNode createContent(String value) {
		MultiTreeNode htmlNode = new MultiTreeNode("Content: ", value);
		return htmlNode;
	}

	public MultiTreeNode createAttribute(String attribute, String value) {
		MultiTreeNode newNode = new MultiTreeNode("Attribute element", attribute);

		if (value != "") {
			MultiTreeNode valueNode = new MultiTreeNode("Attribute value", value);
			newNode.addChildNode(valueNode);
		}

		return newNode;
	}

	protected MultiTreeNode createElement(String tagName, MultiTreeNode attributeList, MultiTreeNode contentList) {
		MultiTreeNode tagNode = new MultiTreeNode(tagName);

		if (attributeList != null) {
			tagNode.addChildNode(attributeList);
		}

		if (contentList != null) {
			tagNode.addChildNode(contentList);
		}

		return tagNode;
	}

	protected MultiTreeNode createElement(String tagName, MultiTreeNode content) {
		MultiTreeNode newNode = new MultiTreeNode(tagName);
		if (content != null) {
			newNode.addChildNode(content);
		}
		return newNode;
	}

	protected MultiTreeNode createElement(String tagName, String content) {
		MultiTreeNode newNode = new MultiTreeNode(tagName);
		MultiTreeNode childNode = new MultiTreeNode("Content", content);

		newNode.addChildNode(childNode);
		return newNode;
	}

	protected MultiTreeNode createListNode(String listName, MultiTreeNode firstChild) {
		MultiTreeNode newNode = new MultiTreeNode(listName);
		newNode.addChildNode(firstChild);
		return newNode;
	}
}