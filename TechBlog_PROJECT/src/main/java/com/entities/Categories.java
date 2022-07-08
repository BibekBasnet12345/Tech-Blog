package com.entities;

        public class Categories {
         private int cid;
         private String cName;
         private String description;
		public Categories(int cid, String cName, String description) {
			super();
			this.cid = cid;
			this.cName = cName;
			this.description = description;
		}
		public Categories() {
			super();
			// TODO Auto-generated constructor stub
		}
		public Categories(String cName, String description) {
			super();
			this.cName = cName;
			this.description = description;
		}
		public int getCid() {
			return cid;
		}
		public void setCid(int cid) {
			this.cid = cid;
		}
		public String getcName() {
			return cName;
		}
		public void setcName(String cName) {
			this.cName = cName;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
         
      }
