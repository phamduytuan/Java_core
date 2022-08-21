package tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

public class TheLap extends BodyTagSupport{
	private Integer n;

	@Override
	public int doAfterBody() throws JspException {
		n--;
		if(n<1)
			return SKIP_BODY;
		else
			return EVAL_BODY_AGAIN;
	}

	@Override
	public int doEndTag() throws JspException {
		if(n<1)
			return SKIP_PAGE;
		else
			return EVAL_PAGE;
	}

	@Override
	public int doStartTag() throws JspException {
		if(n<1)
			return SKIP_BODY;
		else
			return EVAL_BODY_INCLUDE;
	}

	public Integer getN() {
		return n;
	}

	public void setN(Integer n) {
		this.n = n;
	}	
	
}
