package com.platform.api.business.subsy.entity;


import com.platform.common.entity.BizBaseEntity;

import java.math.BigDecimal;


/**
 * db_table: mst_subsy_base 
 */
public class MstSubsyBaseEntity extends BizBaseEntity {

	//columns START
	/**
	 * 业务基础会所基本id		db_column: mst_subsy_base_id */
	private Integer mstSubsyBaseId;
	/**
	 * 会所code		db_column: subsy_code */
	private String subsyCode;
	/**
	 * 会所名称		db_column: subsy_name */
	private String subsyName;
	/**
	 * 会所显示名称		db_column: subsy_disp_name */
	private String subsyDispName;
	/**
	 * 所在省code		db_column: loct_prov_code */
	private String loctProvCode;
	/**
	 * 所在市code		db_column: loct_city_code */
	private String loctCityCode;
	/**
	 * 所在市code		db_column: loct_area_code */
	private String loctAreaCode;
	/**
	 * 会所地址		db_column: subsy_addr */
	private String subsyAddr;
	/**
	 * 所在经度		db_column: loct_lon */
	private BigDecimal loctLon;
	/**
	 * 所在纬度		db_column: loct_lat */
	private BigDecimal loctLat;
	/**
	 * 电话号码		db_column: phone_num */
	private String phoneNum;
	/**
	 * 手机号码		db_column: mob_num */
	private String mobNum;
	/**
	 * 邮政编号		db_column: post_no */
	private String postNo;
	/**
	 * 会所描述		db_column: subsy_desc */
	private String subsyDesc;
	/**
	 * 营业时间描述		db_column: busi_time_desc */
	private String busiTimeDesc;
	/**
	 * 品牌code:{cfg_gen：类型0003}		db_column: brand_code */
	private String brandCode;
	/**
	 * bannerurl		db_column: banr_url */
	private String banrUrl;
	/**
	 * 均价		db_column: price */
	private Integer price;
	/**
	 * 人气值		db_column: popul_val */
	private BigDecimal populVal;
	/**
	 * 服务评分		db_column: serv_score */
	private BigDecimal servScore;
	/**
	 * 首页显示预约flag:{0：不预约首页展示；1：预约首页展示}		db_column: home_disp_resv_flg */
	private Boolean homeDispResvFlg;
	//columns END



	//get set START
	/** 业务基础会所基本id		db_column: mst_subsy_base_id */
	public void setMstSubsyBaseId(Integer mstSubsyBaseId) {
		this.mstSubsyBaseId = mstSubsyBaseId;
	}
	/** 业务基础会所基本id		db_column: mst_subsy_base_id */
	public Integer getMstSubsyBaseId() {
		return this.mstSubsyBaseId;
	}
	/** 会所code		db_column: subsy_code */
	public void setSubsyCode(String subsyCode) {
		this.subsyCode = subsyCode;
	}
	/** 会所code		db_column: subsy_code */
	public String getSubsyCode() {
		return this.subsyCode;
	}
	/** 会所名称		db_column: subsy_name */
	public void setSubsyName(String subsyName) {
		this.subsyName = subsyName;
	}
	/** 会所名称		db_column: subsy_name */
	public String getSubsyName() {
		return this.subsyName;
	}
	/** 会所显示名称		db_column: subsy_disp_name */
	public void setSubsyDispName(String subsyDispName) {
		this.subsyDispName = subsyDispName;
	}
	/** 会所显示名称		db_column: subsy_disp_name */
	public String getSubsyDispName() {
		return this.subsyDispName;
	}
	/** 所在省code		db_column: loct_prov_code */
	public void setLoctProvCode(String loctProvCode) {
		this.loctProvCode = loctProvCode;
	}
	/** 所在省code		db_column: loct_prov_code */
	public String getLoctProvCode() {
		return this.loctProvCode;
	}
	/** 所在市code		db_column: loct_city_code */
	public void setLoctCityCode(String loctCityCode) {
		this.loctCityCode = loctCityCode;
	}
	/** 所在市code		db_column: loct_city_code */
	public String getLoctCityCode() {
		return this.loctCityCode;
	}
	/** 所在市code		db_column: loct_area_code */
	public void setLoctAreaCode(String loctAreaCode) {
		this.loctAreaCode = loctAreaCode;
	}
	/** 所在市code		db_column: loct_area_code */
	public String getLoctAreaCode() {
		return this.loctAreaCode;
	}
	/** 会所地址		db_column: subsy_addr */
	public void setSubsyAddr(String subsyAddr) {
		this.subsyAddr = subsyAddr;
	}
	/** 会所地址		db_column: subsy_addr */
	public String getSubsyAddr() {
		return this.subsyAddr;
	}
	/** 所在经度		db_column: loct_lon */
	public void setLoctLon(BigDecimal loctLon) {
		this.loctLon = loctLon;
	}
	/** 所在经度		db_column: loct_lon */
	public BigDecimal getLoctLon() {
		return this.loctLon;
	}
	/** 所在纬度		db_column: loct_lat */
	public void setLoctLat(BigDecimal loctLat) {
		this.loctLat = loctLat;
	}
	/** 所在纬度		db_column: loct_lat */
	public BigDecimal getLoctLat() {
		return this.loctLat;
	}
	/** 电话号码		db_column: phone_num */
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	/** 电话号码		db_column: phone_num */
	public String getPhoneNum() {
		return this.phoneNum;
	}
	/** 手机号码		db_column: mob_num */
	public void setMobNum(String mobNum) {
		this.mobNum = mobNum;
	}
	/** 手机号码		db_column: mob_num */
	public String getMobNum() {
		return this.mobNum;
	}
	/** 邮政编号		db_column: post_no */
	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}
	/** 邮政编号		db_column: post_no */
	public String getPostNo() {
		return this.postNo;
	}
	/** 会所描述		db_column: subsy_desc */
	public void setSubsyDesc(String subsyDesc) {
		this.subsyDesc = subsyDesc;
	}
	/** 会所描述		db_column: subsy_desc */
	public String getSubsyDesc() {
		return this.subsyDesc;
	}
	/** 营业时间描述		db_column: busi_time_desc */
	public void setBusiTimeDesc(String busiTimeDesc) {
		this.busiTimeDesc = busiTimeDesc;
	}
	/** 营业时间描述		db_column: busi_time_desc */
	public String getBusiTimeDesc() {
		return this.busiTimeDesc;
	}
	/** 品牌code:{cfg_gen：类型0003}		db_column: brand_code */
	public void setBrandCode(String brandCode) {
		this.brandCode = brandCode;
	}
	/** 品牌code:{cfg_gen：类型0003}		db_column: brand_code */
	public String getBrandCode() {
		return this.brandCode;
	}
	/** bannerurl		db_column: banr_url */
	public void setBanrUrl(String banrUrl) {
		this.banrUrl = banrUrl;
	}
	/** bannerurl		db_column: banr_url */
	public String getBanrUrl() {
		return this.banrUrl;
	}
	/** 均价		db_column: price */
	public void setPrice(Integer price) {
		this.price = price;
	}
	/** 均价		db_column: price */
	public Integer getPrice() {
		return this.price;
	}
	/** 人气值		db_column: popul_val */
	public void setPopulVal(BigDecimal populVal) {
		this.populVal = populVal;
	}
	/** 人气值		db_column: popul_val */
	public BigDecimal getPopulVal() {
		return this.populVal;
	}
	/** 服务评分		db_column: serv_score */
	public void setServScore(BigDecimal servScore) {
		this.servScore = servScore;
	}
	/** 服务评分		db_column: serv_score */
	public BigDecimal getServScore() {
		return this.servScore;
	}
	/** 首页显示预约flag:{0：不预约首页展示；1：预约首页展示}		db_column: home_disp_resv_flg */
	public void setHomeDispResvFlg(Boolean homeDispResvFlg) {
		this.homeDispResvFlg = homeDispResvFlg;
	}
	/** 首页显示预约flag:{0：不预约首页展示；1：预约首页展示}		db_column: home_disp_resv_flg */
	public Boolean getHomeDispResvFlg() {
		return this.homeDispResvFlg;
	}
	//get set End

	public String toString() {
		return "MstSubsyBaseEntity [" +
				"MstSubsyBaseId=" + getMstSubsyBaseId() + ", " +
				"SubsyCode=" + getSubsyCode() + ", " +
				"SubsyName=" + getSubsyName() + ", " +
				"SubsyDispName=" + getSubsyDispName() + ", " +
				"LoctProvCode=" + getLoctProvCode() + ", " +
				"LoctCityCode=" + getLoctCityCode() + ", " +
				"LoctAreaCode=" + getLoctAreaCode() + ", " +
				"SubsyAddr=" + getSubsyAddr() + ", " +
				"LoctLon=" + getLoctLon() + ", " +
				"LoctLat=" + getLoctLat() + ", " +
				"PhoneNum=" + getPhoneNum() + ", " +
				"MobNum=" + getMobNum() + ", " +
				"PostNo=" + getPostNo() + ", " +
				"SubsyDesc=" + getSubsyDesc() + ", " +
				"BusiTimeDesc=" + getBusiTimeDesc() + ", " +
				"BrandCode=" + getBrandCode() + ", " +
				"BanrUrl=" + getBanrUrl() + ", " +
				"Price=" + getPrice() + ", " +
				"PopulVal=" + getPopulVal() + ", " +
				"ServScore=" + getServScore() + ", " +
				"CrtTime=" + getCrtTime() + ", " +
				"CrtUserCode=" + getCrtUserCode() + ", " +
				"UpdTime=" + getUpdTime() + ", " +
				"UpdUserCode=" + getUpdUserCode() + ", " +
				"DelFlg=" + getDelFlg() + ", " +
				"VerNum=" + getVerNum() + ", " +
				"HomeDispResvFlg=" + getHomeDispResvFlg() +
				"]";
	}

}


