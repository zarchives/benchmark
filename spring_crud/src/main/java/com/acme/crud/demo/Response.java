package com.acme.crud.demo;

import java.util.List;

public class Response<T> {
	private long count;
	private List<T> result;
	
	public Response(long count, List<T> result) {
		this.count = count;
		this.result = result;
	}
	
	public long getCount() {
		return count;
	}
	public void setCount(long count) {
		this.count = count;
	}
	public List<T> getResult() {
		return result;
	}
	public void setResult(List<T> result) {
		this.result = result;
	}
	
}
