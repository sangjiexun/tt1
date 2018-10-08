<%@ page language="java"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page buffer="256kb" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-kit.tld" prefix="kit"%>
<kit:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<title><bean:message key="com.title.ediJyuHacyuDataShori" /><kit:write name="ediJuchuMainte_Edit" property="modeNm" scope="request" ignore="true" /></title>
<link rel="stylesheet" href="./css/style.css" type="text/css">
<link rel="stylesheet" href="./css/styleKz.css" type="text/css">
<link rel="stylesheet" href="./css/styleKzView.css" type="text/css">
<link rel="stylesheet" href="./css/print.css" type="text/css" media="print">

<script src="./js/pbsControl.js"></script>
<script src="./js/comControl.js"></script>
<script src="./js/comMaster.js"></script>
<script src="./js/kzControl.js"></script>

<script type="text/javascript">

	function setHomePosition() {
		// ホームオブジェクトを指定
		HOME_OBJECT = document.ediJuchuMainte_Edit.elements["ediJuchuMainteRecord[0].syoriKbn"];
	}

	// 画面固有の明細部以外領域の高さ指定
	var othersHeight = 235;

	// ヘッダ固定
	//@@@ タイトル固定呪文 ここから @@@@@@@@@@@@@@
	window.onresize = localResize;
	function localResize() {
		resize();
		//setLocalHeight("list" ,"details" ,45);
	}
	//@@@ タイトル固定呪文 ここまで @@@@@@@@@@@@@@

	// エラー時フォーカス用メソッド
	function setFocusLocal() {
		// エラー時フラグ用配列
		var errorClassArr = new Array(
			"syoriKbnClass",
			"syukaYoteiDtClass",
			"minasiDtClass",
			"tatesnCdClass");

		//エラー時フォーカス用配列
		var errorObjArr = new Array(
			"syoriKbn",
			"syukaYoteiDt",
			"minasiDt",
			"tatesnCd");

		// 明細部のフォーム名を指定する
		var formNm = "ediJuchuMainte_Edit";
		var recNm = "ediJuchuMainteRecord";
		var form = document.forms[formNm];
		var maxSu = 1;

		setFocusForError(formNm, maxSu, errorClassArr, errorObjArr,recNm);
	}

	function setFocusLocalDt() {

		// エラー時フラグ用配列
		var errorClassArr = new Array(
			"shohinCdClass",
			"syukaSuBaraClass",
			"syukaSuCaseClass");

		//エラー時フォーカス用配列
		var errorObjArr = new Array(
			"shohinCd",
			"syukaSuBara",
			"syukaSuCase");

		// 明細部のフォーム名を指定する
		var formNm = "ediJuchuMainte_Edit";
		var recNm = "ediJuchuMainteDtRecord";
		var form = document.forms[formNm];
		var maxSu = form.maxSu.value;
		setFocusForError(formNm, maxSu, errorClassArr, errorObjArr,recNm);
	}

	// 非同期通信（パラメータ設定）
	function getValueByAjax(keyObj, keyNm, targetNms) {
		var formNm = "ediJuchuMainte_Edit";
		var form = document.forms[formNm];
		var keyValue = form.elements[keyObj.name].value; // 呼び出し元キー

		var url = "/kit/ediJuchuMainte_Ajax.do?objCd=" + keyValue + "&objNm=" + keyNm;

		getValueByCodeForAjax(url, formNm, keyObj, targetNms);
	}
</script>

<style type="text/css">
<!--
/** 検索部 */
table.form {
	height: 30px;
	width: 100%;
}

table.form td {
	white-space: nowrap;
}

/* 見栄え調整用 */
table.form label.layout {
	margin-left: 1.5em;
}

/* @@@ タイトル固定呪文 ここから @@@@@@@@@@@@@@@@@@@@@@@@*/
.wrapper {
	/* 左詰めにする表全体*/
	width: 100%;
	text-align: left;
}


.listH{float:left; margin-left:5px;}
#listSelect{float:left; width:90em}
#listOrosien{float:left; width:90em}
.listLH{float:left;height:105px;}
.fixedTitleTableSelect{
	width:102em
}
.fixedTitleTableOrosien{
	width:124em
}


/* table */
.jheader {border-collapse:collapse; font-size:11pt; border:2px solid #778899;}
.jdetail {border-collapse:collapse; font-size:11pt; border:2px solid #778899;}
/* td 項目名 値 */
.jitem {border-collapse:collapse; font-size:11pt; border:2px solid #778899; background-color:#F0FFF0;}
.jdata {border-collapse:collapse; font-size:11pt; border:2px solid #778899; background-color:#FFFFFF;}
.jitem1 {border-collapse:collapse; font-size:11pt; border:2px solid #778899; background-color:#FAFAD2;}


/* 一覧表レイアウト */
.tx2emWidth {width: 2em;}
.tx3emWidth {width: 3em;}
.tx4emWidth {width: 4em;}
.tx5emWidth {width: 5em;}
.tx6emWidth {width: 6em;}
.tx7emWidth {width: 7em;}
.tx8emWidth {width: 8em;}
.tx10emWidth {width: 10em;}
.tx12emWidth {width: 12em;}
.tx13emWidth {width: 13em;}
.tx20emWidth {width: 20em;}
.tx28emWidth {width: 28em;}
.tx30emWidth {width: 30em;}


TD.error {
	background-color:#FF7F50;
	border:2px solid #778899;
}
TD.modified {
	background-color:#A0D8EF;
	border:2px solid #778899;
}

/* 検索ボタン */
table.form td.searchFormButtonRow div.center {
	text-align: center;
}

table.form td.searchFormButtonRow div.left {
	text-align: left;
}

table.form td.searchFormButtonRow div.right {
	text-align: right;
}

/* 明細部フッタボタン */
#footButtons {
	width: 99%;
	margin: 0;
	padding: 0;
}

#footButtons td.side {
	width: 23%;
}

#footButtons td.center {
	width: 53%;
}

#footButtons td.center input {
}

div.tabLink li {
	margin-top: 5px;
	float: left;
	display: block;
	font-size: 1.2em;
	white-space: nowrap;
}

.floatClear {
	clear: both;
}

.floatRight {
	float: right;
}

.floatLeft {
	float: left;
}
-->
</style>

</head>
<body
	<%-- onContextmenu="return false" --%>
	onLoad="eventLoad();
			setHomePosition();
			setFocusLocal();
			setFocusLocalDt();
	"
	onbeforeunload="return eventUnloadMain()"
	onhelp="return false;">
	<%-- 共通ヘッダー開始 --%>
	<%@ include file="/parts/comHeader.jsp" %>
	<%-- 共通ヘッダー終了 --%>
	<%-- 検索条件入力フォーム開始 --%>
	<kit:form action="/ediJuchuMainte_Search.do" styleClass="searchForm">
		<%-- タイトル開始 --%>
		<div class="title">
			<bean:message key="com.title.ediJyuHacyuDataShori" />
			<kit:write name="ediJuchuMainte_Edit" property="modeNm" scope="request" ignore="true" />
		</div>
		<%-- タイトル終了 --%>
		<kit:hidden name="ediJuchuMainte_Search" property="editable" />
		<kit:hidden name="ediJuchuMainte_Search" property="reqType" />

		<table class="form">
			<tr>
				<td class="right">
					<%-- ポップアップ検索 --%>
					<kit:button styleClass="btn_search btn_large"
						property="btnPopupSearch"
						onclick="openModalSearch(this.form.kaisyaCd.value)">
						<bean:message key="com.button.knsk" />
					</kit:button>
				</td>
			</tr>
		</table>

	</kit:form>
	<%-- 検索条件入力フォーム終了 --%>
	<hr />
	<%-- 登録・更新・削除フォーム開始 --%>
	<kit:form action="/ediJuchuMainte_Edit.do" styleId="editForm">
		<kit:hidden name="ediJuchuMainte_Edit" property="editable" />
		<kit:hidden name="ediJuchuMainte_Edit" property="reqType" />
		<kit:hidden name="ediJuchuMainte_Edit" property="mode" />
		<kit:hidden name="ediJuchuMainte_Edit" property="preMode" />
		<kit:hidden name="ediJuchuMainte_Edit" property="maxSu" />
		<%-- FIXME:追加時に行数調整するための変数 --%>
		<kit:hidden name="ediJuchuMainte_Edit" property="maxLineSu" />
		<kit:hidden name="ediJuchuMainte_Edit" property="selectedRowId" />
		<kit:hidden name="ediJuchuMainte_Edit" property="hasPrevPage" defaultValue="false" />
		<kit:hidden name="ediJuchuMainte_Edit" property="hasNextPage" defaultValue="false" />

		<%-- ヘッダー部 --%>
		<kit:iterate id="ediJuchuMainteRecord" name="ediJuchuMainte_EditList" property="pageList" indexId="idx" tabStartIndex="1" scope="session" >
			<div class="list_top">
				<table class="jheader">
					<tr>
						<%-- 受信日時 --%>
						<th class="jitem tx6emWidth"><bean:message key="com.text.jyusinNiji" /></th>
						<td class="dtView jdata tx10emWidth" >
							<kit:write name="ediJuchuMainteRecord" property="jyusinDt" format="yyyy/mm/dd"/>&nbsp;
							<kit:write name="ediJuchuMainteRecord" property="jyusinTm" format="hh:mm:ss"/>
						</td>
						<%-- 処理区分 --%>
						<th class="jitem tx6emWidth"><bean:message key="com.text.syoriKb" /></th>
						<kit:td name="ediJuchuMainteRecord" property="syoriKbnClass"
								styleClass="stView jdata tx8emWidth">
							<kit:select styleId="syoriKbnLbl" name="ediJuchuMainteRecord"
								styleClass="list ime_off" property="syoriKbn"  tabindex="true" indexed="true"
								onkeypress="ctrlSelection(this)">
								<kit:options collection="ediJuchuMainte_ShoriKbnList"
									optional="false" useDefault="true" ignoreFlg="false" />
							</kit:select>
						</kit:td>
						<%-- ﾃﾞｰﾀ有無 --%>
						<th class="jitem tx6emWidth"><bean:message key="com.text.dataAriNasi" /></th>
						<td class="mjView jdata tx6emWidth" >
							<kit:write name="ediJuchuMainteRecord" property="dataUmuKbn" ignore="true"
							           decodeList="ediJuchuMainte_DataAriNashiList" decodeWrite ="label"/>
						</td>
						<%-- 更新者 --%>
						<th class="jitem tx6emWidth"><bean:message key="com.text.kousinSgyosya" /></th>
						<td class="mjView jdata tx10emWidth" >
							<kit:write name="ediJuchuMainteRecord" property="sgyosyaNm" ignore="true"/>
						</td>
						<%-- 重複区分 --%>
						<th class="jitem tx6emWidth"><bean:message key="com.text.cyofukuKbn" /></th>
						<td class="mjView jdata tx6emWidth" >
							<kit:write name="ediJuchuMainteRecord" property="cyofukuKbn" ignore="true"
								decodeList="ediJuchuMainte_AriNasiList" decodeWrite ="label" />
						</td>
					</tr>
				</table>
			</div>
			<div class="list_top floatLeft" >
				<table class="jheader">
				<tr>
					<%-- kz出荷予定日 --%>
					<th class="jitem tx8emWidth"><bean:message key="com.text.syukaYoteibi" /></th>
					<kit:td name="ediJuchuMainteRecord" property="syukaYoteiDtClass"
								styleClass="dtView jdata tx6emWidth">
						<kit:text name="ediJuchuMainteRecord" property="syukaYoteiDt" maxlength="8" size="14"
							styleClass="text ime_off date frm_dt right"
							styleId="syukaYoteiDtLbl" tabindex="true" indexed="true"
							onkeyup="nextTabMaxLenInput()" onblur="ctrlInput()" onfocus="ctrlInput()"
							format="yyyy/mm/dd" />
					</kit:td>
					<%-- 出荷日注意 --%>
					<th class="jitem tx8emWidth"><bean:message key="com.text.sykkaDtChui" /></th>
					<kit:td name="ediJuchuMainteRecord" property="tatesnCdClass"
							styleClass="mjView jdata tx8emWidth">
						<kit:text name="ediJuchuMainteRecord" property="syukaDtCyuiKbn" maxlength="12" size="16"
							styleClass="text ime_off left readonly"
							styleId="syukaDtCyuiKbnLbl" readonly="true" tabindex="false" indexed="true"
							onblur="ctrlInput()" onfocus="ctrlInput()"/>
					</kit:td>
				</tr>
				<tr>
					<%-- 納品/引取日 --%>
					<th class="jitem tx8emWidth"><bean:message key="com.text.nohinHikitoribi" /></th>
					<td class="dtView jdata">
						<kit:write name="ediJuchuMainteRecord" property="dhNonyuDt" ignore="true" format="yyyy/mm/dd"/>
					</td>
					<%-- Kz受注No --%>
					<th class="jitem tx8emWidth"><bean:message key="com.text.kzJyucyuNo" /></th>
					<td class="mjView jdata">
						<kit:write name="ediJuchuMainteRecord" property="jyucyuNo" ignore="true"/>
					</td>
				</tr>
				<tr>
					<%-- 納品時間 --%>
					<th class="jitem"><bean:message key="com.text.nouhinJikan" /></th>
					<td class="mjView jdata">
						<kit:write name="ediJuchuMainteRecord" property="dhNonyuTm" ignore="true"
							decodeList="ediJuchuMainte_NohinJikanList" decodeWrite ="label"/>
					</td>
					<%-- 蔵入/直送区分 --%>
					<th class="jitem"><bean:message key="com.text.kuraCyokusoKbn" /></th>
					<td class="mjView jdata">
						<kit:write name="ediJuchuMainteRecord" property="dhKuraKbn" ignore="true"
							decodeList="ediJuchuMainte_KuraCyokusoList" decodeWrite ="label"/>
					</td>
				</tr>
				<tr>
					<%-- 発注No --%>
					<th class="jitem tx8emWidth"><bean:message key="com.text.hacyuNo" /></th>
					<td class="mjView jdata">
						<kit:write name="ediJuchuMainteRecord" property="dhDenpyoNo" ignore="true"/>
					</td>
					<%-- Kz縦線CD --%>
					<th class="jitem tx8emWidth"><bean:message key="com.text.kzTatesenCD" /></th>
					<kit:td name="ediJuchuMainteRecord" property="tatesnCdClass"
								styleClass="cdnView jdata">
						<kit:text name="ediJuchuMainteRecord" property="tatesnCd"
								maxlength="8" size="10"
								styleClass="text ime_off code frm_lpad right searchable"
								styleId="tatesnCdLbl" tabindex="true" indexed="true"
								onkeyup="nextTabMaxLenInput()"
								onblur="ctrlInput(FRM_CLASS_PAD,8,'0');
								setRefObjSyuka('popup','orsTatesnCd',this,'orositenCd1Jiten','orositenCd1Jiten','orositenNm1JitenRyaku','orositenNm1JitenRyaku',
											'orositenCdDepo','orositenCdDepo','orositenNmDepoRyaku','orositenNmDepoRyaku',
											'orositenCd2Jiten','orositenCd2Jiten','orositenNm2JitenRyaku','orositenNm2JitenRyaku',
											'orositenCd3Jiten','orositenCd3Jiten','orositenNm3JitenRyaku','orositenNm3JitenRyaku',
											'syukaDtCyuiKbn','syukaDtCyuiKbn','hacyuTantosyaNm','hacyuTantosyaNm','hacyumotoTel','hacyumotoTel',
											'address1Jiten','address1Jiten','tel1Jiten','tel1Jiten',
											'addressDepo','addressDepo','telDepo','telDepo',
											'address2Jiten','address2Jiten','tel2Jiten','tel2Jiten',
											'address3Jiten','address3Jiten','tel3Jiten','tel3Jiten');
								getValueByAjax(this,'tatesenCd','syukaDtCyuiKbn,hacyuTantosyaNm,hacyumotoTel,orositenCd1Jiten,orositenNm1JitenRyaku,address1Jiten,tel1Jiten,orositenCdDepo,orositenNmDepoRyaku,addressDepo,telDepo,orositenCd2Jiten,orositenNm2JitenRyaku,address2Jiten,tel2Jiten,orositenCd3Jiten,orositenNm3JitenRyaku,address3Jiten,tel3Jiten')"
								onfocus="ctrlInput();setPreValueForAjax(this);" />
					</kit:td>
				</tr>
				<tr>
					<%-- 発注担当者 --%>
					<th class="jitem tx8emWidth"><bean:message key="com.text.hattyuTantosya" /></th>
					<kit:td name="ediJuchuMainteRecord" property="tatesnCdClass"
							styleClass="mjView jdata ">
						<kit:text name="ediJuchuMainteRecord" property="hacyuTantosyaNm" maxlength="8" size="16"
							styleClass="text ime_off left readonly"
							styleId="hacyuTantosyaNmLbl" readonly="true" tabindex="false" indexed="true"
							onblur="ctrlInput()" onfocus="ctrlInput()"/>
					</kit:td>
					<%-- 発注元TEL --%>
					<th class="jitem tx8emWidth"><bean:message key="com.text.hatmtTel2" /></th>
					<kit:td name="ediJuchuMainteRecord" property="tatesnCdClass"
							styleClass="mjView jdata ">
						<kit:text name="ediJuchuMainteRecord" property="hacyumotoTel" maxlength="148" size="16"
							styleClass="text ime_off left readonly"
							styleId="hacyumotoTelLbl" readonly="true" tabindex="false" indexed="true"
							onblur="ctrlInput()" onfocus="ctrlInput()"/>
					</kit:td>
				</tr>
				</table>
			</div>
			<div class="list_top listH" >
				<table class="jheader">
					<tr>
						<%-- ﾃﾞｰﾀ作成日 --%>
						<th class="jitem tx6emWidth"><bean:message key="com.text.dataSakuseibi" /></th>
						<td class="dtView jdata tx6emWidth">
							<kit:write name="ediJuchuMainteRecord" property="fhDataSakuseiDt" ignore="true" format="yyyy/mm/dd" />
						</td>
						<%-- ﾃﾞｰﾀID --%>
						<th class="jitem tx6emWidth"><bean:message key="com.text.dataID" /></th>
						<td class="nmView jdata tx8emWidth">
							<kit:write name="ediJuchuMainteRecord" property="ediJyuhacyuId" ignore="true" />
						</td>
					</tr>
					<tr>
						<%-- ﾃﾞｰﾀ送信日 --%>
						<th class="jitem"><bean:message key="com.text.dataSousinbi" /></th>
						<td class="dtView jdata">
							<kit:write name="ediJuchuMainteRecord" property="fhDataSyoriDt" ignore="true" format="yyyy/mm/dd" />
						</td>
					</tr>
				</table>
			</div>
			<div class="list_top listH" >
				<table class="jheader">
					<tr>
						<%-- ｴﾗｰ区分 --%>
						<th class="jitem tx8emWidth"><bean:message key="com.text.errorKbn" /></th>
						<td class="mjView jdata tx13emWidth">
							<kit:write name="ediJuchuMainteRecord" property="errorKbn" ignore="true" />
						</td>
					</tr>
				</table>
			</div>
			<div class="list_top listH" >
				<table class="jheader">
					<tr>
						<%-- ﾃﾞｰﾀ発信元 --%>
						<th class="jitem tx6emWidth"><bean:message key="com.text.dataHasinMoto" /></th>
						<td class="mjView jdata tx28emWidth">
							<kit:write name="ediJuchuMainteRecord" property="dataHasinMoto" ignore="true" />
						</td>
					</tr>
					<tr>
						<%-- 備考 --%>
						<th class="jitem tx6emWidth"><bean:message key="com.text.bikou" /></th>
						<td class="mjView jdata tx28emWidth">
							<kit:write name="ediJuchuMainteRecord" property="dhBikou" ignore="true" />
						</td>
					</tr>
				</table>
			</div>

			<div id="listOrosien" class="list_top fixedTitleX" >
			<table class="jheader fixedTitleTableOrosien">
				<tr>
					<th class="jitem tx4emWidth"></th>
					<%-- 帳合ｺｰﾄﾞ --%>
					<th class="jitem tx4emWidth"><bean:message key="com.text.cyoaiCode" /></th>
					<%-- 帳合名 --%>
					<th class="jitem tx20emWidth"><bean:message key="com.text.cyoaiNm" /></th>
					<%-- 住所 --%>
					<th class="jitem tx28emWidth"><bean:message key="com.text.jyusyo" /></th>
					<%-- TEL --%>
					<th class="jitem tx6emWidth"><bean:message key="com.text.tel" /></th>
					<th class="jitem1 tx4emWidth"></th>
					<%-- 卸店CD --%>
					<th class="jitem1 tx4emWidth"><bean:message key="com.text.orositenCd" /></th>
					<%-- 卸店名 --%>
					<th class="jitem1 tx12emWidth"><bean:message key="com.text.orositenNm" /></th>
					<%-- 卸店住所 --%>
					<th class="jitem1 tx30emWidth"><bean:message key="com.text.jyusyo" /></th>
					<%-- 卸店TEL --%>
					<th class="jitem1 tx7emWidth"><bean:message key="com.text.tel" /></th>
				</tr>
				<tr>
					<%-- 1次店 --%>
					<th class="jitem"><bean:message key="com.text.ijiten" /></th>
					<%-- 1次店ｺｰﾄ --%>
					<td class="cdnView jdata">
						<kit:write name="ediJuchuMainteRecord" property="dhIchijitenCd" ignore="true" />
					</td>
					<%-- 1次店名 --%>
					<td class="mjView jdata">
						<kit:write name="ediJuchuMainteRecord" property="hoKaisyaNm1" ignore="true" />
					</td>
					<%-- 1次店住所 --%>
					<td class="mjView jdata">
						<kit:write name="ediJuchuMainteRecord" property="hoKaisyaAddr1" ignore="true" />
					</td>
					<%-- 1次店TEL --%>
					<td class="mjView jdata">
						<kit:write name="ediJuchuMainteRecord" property="hoKaisyaTel1" ignore="true" />
					</td>
					<%-- 特約店 --%>
					<th class="jitem1 tx4emWidth"><bean:message key="com.text.tokuyakuten" /></th>
					<%-- 特約CD --%>
					<kit:td name="ediJuchuMainteRecord" property="tatesnCdClass" styleClass="cdnView jdata">
						<kit:text name="ediJuchuMainteRecord" property="orositenCd1Jiten" maxlength="6" size="8"
							styleClass="text ime_on right readonly" styleId="orositenCd1JitenLbl"
							readonly="true" tabindex="false" indexed="true"
							onblur="ctrlInput()" onfocus="ctrlInput()" />
					</kit:td>
					<%-- 特約名 --%>
					<kit:td name="ediJuchuMainteRecord" property="tatesnCdClass" styleClass="mjView jdata">
						<kit:text name="ediJuchuMainteRecord" property="orositenNm1JitenRyaku" maxlength="12" size="27"
							styleClass="text ime_on left readonly" styleId="orositenNm1JitenRyakuLbl"
							readonly="true" tabindex="false" indexed="true"
							onblur="ctrlInput()" onfocus="ctrlInput()" />
					</kit:td>
					<%-- 特約店住所 --%>
					<kit:td name="ediJuchuMainteRecord" property="tatesnCdClass" styleClass="mjView jdata">
						<kit:text name="ediJuchuMainteRecord" property="address1Jiten" maxlength="30" size="74"
							styleClass="text ime_on left readonly" styleId="address1JitenLbl"
							readonly="true" tabindex="false" indexed="true"
							onblur="ctrlInput()" onfocus="ctrlInput()" />
					</kit:td>
					<%-- 特約店TEL --%>
					<kit:td name="ediJuchuMainteRecord" property="tatesnCdClass" styleClass="mjView jdata">
						<kit:text name="ediJuchuMainteRecord" property="tel1Jiten" maxlength="14" size="16"
							styleClass="text ime_on left readonly" styleId="tel1JitenLbl"
							readonly="true" tabindex="false" indexed="true"
							onblur="ctrlInput()" onfocus="ctrlInput()" />
					</kit:td>
				</tr>
				<tr>
					<%-- 2次店 --%>
					<th class="jitem"><bean:message key="com.text.nijiten" /></th>
					<%-- 2次店ｺｰﾄ --%>
					<td class="cdnView jdata">
						<kit:write name="ediJuchuMainteRecord" property="dhNijitenCd" ignore="true" />
					</td>
					<%-- 2次店名 --%>
					<td class="mjView jdata">
						<kit:write name="ediJuchuMainteRecord" property="hoKaisyaNm2" ignore="true" />
					</td>
					<%-- 2次店住所 --%>
					<td class="mjView jdata">
						<kit:write name="ediJuchuMainteRecord" property="hoKaisyaAddr2" ignore="true" />
					</td>
					<%-- 2次店TEL --%>
					<td class="mjView jdata">
						<kit:write name="ediJuchuMainteRecord" property="hoKaisyaTel2" ignore="true" />
					</td>
					<%-- デポ店 --%>
					<th class="jitem1 tx4emWidth"><bean:message key="com.text.depoten" /></th>
					<%-- デポ店CD --%>
					<kit:td name="ediJuchuMainteRecord" property="tatesnCdClass" styleClass="cdnView jdata">
						<kit:text name="ediJuchuMainteRecord" property="orositenCdDepo" maxlength="6" size="8"
							styleClass="text ime_on right readonly" styleId="orositenCdDepoLbl"
							readonly="true" tabindex="false" indexed="true"
							onblur="ctrlInput()" onfocus="ctrlInput()" />
					</kit:td>
					<%-- デポ店名 --%>
					<kit:td name="ediJuchuMainteRecord" property="tatesnCdClass" styleClass="mjView jdata">
						<kit:text name="ediJuchuMainteRecord" property="orositenNmDepoRyaku" maxlength="12" size="27"
							styleClass="text ime_on left readonly" styleId="orositenNmDepoRyakuLbl"
							readonly="true" tabindex="false" indexed="true"
							onblur="ctrlInput()" onfocus="ctrlInput()" />
					</kit:td>
					<%-- デポ店住所 --%>
					<kit:td name="ediJuchuMainteRecord" property="tatesnCdClass" styleClass="mjView jdata">
						<kit:text name="ediJuchuMainteRecord" property="addressDepo" maxlength="30" size="74"
							styleClass="text ime_on left readonly" styleId="addressDepoLbl"
							readonly="true" tabindex="false" indexed="true"
							onblur="ctrlInput()" onfocus="ctrlInput()" />
					</kit:td>
					<%-- デポ店TEL --%>
					<kit:td name="ediJuchuMainteRecord" property="tatesnCdClass" styleClass="mjView jdata">
						<kit:text name="ediJuchuMainteRecord" property="telDepo" maxlength="14" size="16"
							styleClass="text ime_on left readonly" styleId="telDepoLbl"
							readonly="true" tabindex="false" indexed="true"
							onblur="ctrlInput()" onfocus="ctrlInput()" />
					</kit:td>
				</tr>
				<tr>
					<%-- 3次店 --%>
					<th class="jitem"><bean:message key="com.text.sanjiten" /></th>
					<%-- 3次店ｺｰﾄ --%>
					<td class="cdnView jdata">
						<kit:write name="ediJuchuMainteRecord" property="dhSanjitenCd" ignore="true" />
					</td>
					<%-- 3次店名 --%>
					<td class="mjView jdata">
						<kit:write name="ediJuchuMainteRecord" property="hoKaisyaNm3" ignore="true" />
					</td>
					<%-- 3次店住所 --%>
					<td class="mjView jdata">
						<kit:write name="ediJuchuMainteRecord" property="hoKaisyaAddr3" ignore="true" />
					</td>
					<%-- 3次店TEL --%>
					<td class="mjView jdata">
						<kit:write name="ediJuchuMainteRecord" property="hoKaisyaTel3" ignore="true" />
					</td>
					<%-- 2次店 --%>
					<th class="jitem1 tx4emWidth"><bean:message key="com.text.nijiten" /></th>
					<%-- 2次店CD --%>
					<kit:td name="ediJuchuMainteRecord" property="tatesnCdClass" styleClass="cdnView jdata">
						<kit:text name="ediJuchuMainteRecord" property="orositenCd2Jiten" maxlength="6" size="8"
							styleClass="text ime_on right readonly" styleId="orositenCd2JitenLbl"
							readonly="true" tabindex="false" indexed="true"
							onblur="ctrlInput()" onfocus="ctrlInput()" />
					</kit:td>
					<%-- 2次店名 --%>
					<kit:td name="ediJuchuMainteRecord" property="tatesnCdClass" styleClass="mjView jdata">
						<kit:text name="ediJuchuMainteRecord" property="orositenNm2JitenRyaku" maxlength="12" size="27"
							styleClass="text ime_on left readonly" styleId="orositenNm2JitenRyakuLbl"
							readonly="true" tabindex="false" indexed="true"
							onblur="ctrlInput()" onfocus="ctrlInput()" />
					</kit:td>
					<%-- 2次店住所 --%>
					<kit:td name="ediJuchuMainteRecord" property="tatesnCdClass" styleClass="mjView jdata">
						<kit:text name="ediJuchuMainteRecord" property="address2Jiten" maxlength="30" size="74"
							styleClass="text ime_on left readonly" styleId="address2JitenLbl"
							readonly="true" tabindex="false" indexed="true"
							onblur="ctrlInput()" onfocus="ctrlInput()" />
					</kit:td>
					<%-- 2次店TEL --%>
					<kit:td name="ediJuchuMainteRecord" property="tatesnCdClass" styleClass="mjView jdata">
						<kit:text name="ediJuchuMainteRecord" property="tel2Jiten" maxlength="14" size="16"
							styleClass="text ime_on left readonly" styleId="tel2JitenLbl"
							readonly="true" tabindex="false" indexed="true"
							onblur="ctrlInput()" onfocus="ctrlInput()" />
					</kit:td>
				</tr>
				<tr>
					<%-- 4次店 --%>
					<th class="jitem"><bean:message key="com.text.yojiten" /></th>
					<%-- 4次店ｺｰﾄ --%>
					<td class="cdnView jdata">
						<kit:write name="ediJuchuMainteRecord" property="dhYojitenCd" ignore="true" />
					</td>
					<%-- 4次店名 --%>
					<td class="mjView jdata">
						<kit:write name="ediJuchuMainteRecord" property="hoKaisyaNm4" ignore="true" />
					</td>
					<%-- 4次店住所 --%>
					<td class="mjView jdata">
						<kit:write name="ediJuchuMainteRecord" property="hoKaisyaAddr4" ignore="true" />
					</td>
					<%-- 4次店TEL --%>
					<td class="mjView jdata">
						<kit:write name="ediJuchuMainteRecord" property="hoKaisyaTel4" ignore="true" />
					</td>
					<%-- 3次店 --%>
					<th class="jitem1 tx4emWidth"><bean:message key="com.text.sanjiten" /></th>
					<%-- 3次店CD --%>
					<kit:td name="ediJuchuMainteRecord" property="tatesnCdClass" styleClass="cdnView jdata">
						<kit:text name="ediJuchuMainteRecord" property="orositenCd3Jiten" maxlength="6" size="8"
							styleClass="text ime_on right readonly" styleId="orositenCd3JitenLbl"
							readonly="true" tabindex="false" indexed="true"
							onblur="ctrlInput()" onfocus="ctrlInput()" />
					</kit:td>
					<%-- 3次店名 --%>
					<kit:td name="ediJuchuMainteRecord" property="tatesnCdClass" styleClass="mjView jdata">
						<kit:text name="ediJuchuMainteRecord" property="orositenNm3JitenRyaku" maxlength="12" size="27"
							styleClass="text ime_on left readonly" styleId="orositenNm3JitenRyakuLbl"
							readonly="true" tabindex="false" indexed="true"
							onblur="ctrlInput()" onfocus="ctrlInput()" />
					</kit:td>
					<%-- 3次店住所 --%>
					<kit:td name="ediJuchuMainteRecord" property="tatesnCdClass" styleClass="mjView jdata">
						<kit:text name="ediJuchuMainteRecord" property="address3Jiten" maxlength="30" size="74"
							styleClass="text ime_on left readonly" styleId="address3JitenLbl"
							readonly="true" tabindex="false" indexed="true"
							onblur="ctrlInput()" onfocus="ctrlInput()" />
					</kit:td>
					<%-- 3次店TEL --%>
					<kit:td name="ediJuchuMainteRecord" property="tatesnCdClass" styleClass="mjView jdata">
						<kit:text name="ediJuchuMainteRecord" property="tel3Jiten" maxlength="14" size="16"
							styleClass="text ime_on left readonly" styleId="tel3JitenLbl"
							readonly="true" tabindex="false" indexed="true"
							onblur="ctrlInput()" onfocus="ctrlInput()" />
					</kit:td>
				</tr>
				<tr>
					<%-- 5次店 --%>
					<th class="jitem"><bean:message key="com.text.gojiten" /></th>
					<%-- 5次店ｺｰﾄ --%>
					<td class="cdnView jdata">
						<kit:write name="ediJuchuMainteRecord" property="dhGojitenCd" ignore="true" />
					</td>
					<%-- 5次店名 --%>
					<td class="mjView jdata">
						<kit:write name="ediJuchuMainteRecord" property="hoKaisyaNm5" ignore="true" />
					</td>
					<%-- 5次店住所 --%>
					<td class="mjView jdata">
						<kit:write name="ediJuchuMainteRecord" property="hoKaisyaAddr5" ignore="true" />
					</td>
					<%-- 5次店TEL --%>
					<td class="mjView jdata">
						<kit:write name="ediJuchuMainteRecord" property="hoKaisyaTel5" ignore="true" />
					</td>
				</tr>
			</table>
			</div>

			<%-- レコードのhidden要素（ヘッダー部） --%>
			<%-- 最終送荷先卸CD --%>
			<%-- <kit:hidden property="orositenCdLast" indexed="true" name="ediJuchuMainteRecord" /> --%>
			<%-- EDI受発注商品摘要欄確認区分 --%>
			<%-- <kit:hidden property="ediJsyohinTekiyochekKbn" indexed="true" name="ediJuchuMainteRecord" /> --%>

			<%-- エラー時フォーカス設定用hidden要素 --%>
			<kit:hidden property="syoriKbnClass" indexed="true" name="ediJuchuMainteRecord" />
			<kit:hidden property="syukaYoteiDtClass" indexed="true" name="ediJuchuMainteRecord" />
			<kit:hidden property="minasiDtClass" indexed="true" name="ediJuchuMainteRecord" />
			<kit:hidden property="tatesnCdClass" indexed="true" name="ediJuchuMainteRecord" />
		</kit:iterate>

		<%-- ディテール部 --%>
		<div id="listSelect" class="fixedTitleX list_top" >
			<%-- タイトル行 --%>
			<table class="fixedTitleTableSelect list" style="margin:0;">
				<colgroup class="tx2emWidth"></colgroup> <%-- No --%>
				<colgroup class="tx28emWidth"></colgroup> <%-- 発注商品 --%>
				<colgroup class="tx6emWidth"></colgroup> <%-- 許容日/ライフ --%>
				<colgroup class="tx4emWidth"></colgroup> <%-- 発注数 --%>
				<colgroup class="tx5emWidth"></colgroup> <%-- 単位 --%>
				<colgroup class="tx7emWidth"></colgroup> <%-- 摘要 --%>
				<colgroup class="tx5emWidth"></colgroup> <%-- Kz商品CD --%>
				<colgroup class="tx20emWidth"></colgroup> <%-- Kz商品名 --%>
				<colgroup class="tx4emWidth"></colgroup> <%-- 容器名 --%>
				<colgroup class="tx4emWidth"></colgroup> <%-- ｹｰｽ --%>
				<colgroup class="tx4emWidth"></colgroup> <%-- ﾊﾞﾗ --%>
				<colgroup class="tx13emWidth"></colgroup> <%-- ｴﾗｰ区分 --%>
				<thead>
					<tr class="head">
						<td><bean:message key="com.text.no" /></td>
						<td><bean:message key="com.text.hacyuShohin" /></td>
						<td><bean:message key="com.text.kyoyoLife" /></td>
						<td><bean:message key="com.text.hacyuSu" /></td>
						<td><bean:message key="com.text.tani" /></td>
						<td><bean:message key="com.text.tekiyo" /></td>
						<td class="jitem1"><bean:message key="com.text.kzShohinCD" /></td>
						<td class="jitem1"><bean:message key="com.text.kzShohinNm" /></td>
						<td class="jitem1"><bean:message key="com.text.youkinm" /></td>
						<td class="jitem1"><bean:message key="com.text.case" /></td>
						<td class="jitem1"><bean:message key="com.text.bara" /></td>
						<td class="jitem1"><bean:message key="com.text.errorKbn" /></td>
					</tr>
				</thead>
			</table>
			<div id="details" class="fixedTitleY listLH">
			<table class="fixedTitleTableSelect list" style="margin-top:-1px;">
				<colgroup class="tx2emWidth"></colgroup> <%-- No --%>
				<colgroup class="tx28emWidth"></colgroup> <%-- 発注商品 --%>
				<colgroup class="tx6emWidth"></colgroup> <%-- 許容日 --%>
				<colgroup class="tx4emWidth"></colgroup> <%-- 発注数 --%>
				<colgroup class="tx5emWidth"></colgroup> <%-- 単位 --%>
				<colgroup class="tx7emWidth"></colgroup> <%-- 摘要 --%>
				<colgroup class="tx5emWidth"></colgroup> <%-- Kz商品CD --%>
				<colgroup class="tx20emWidth"></colgroup> <%-- Kz商品名 --%>
				<colgroup class="tx4emWidth"></colgroup> <%-- 容器名 --%>
				<colgroup class="tx4emWidth"></colgroup> <%-- ｹｰｽ --%>
				<colgroup class="tx4emWidth"></colgroup> <%-- ﾊﾞﾗ --%>
				<colgroup class="tx13emWidth"></colgroup> <%-- ｴﾗｰ区分 --%>
				<%-- リスト開始 --%>
				<kit:iterate id="ediJuchuMainteDtRecord"
					name="ediJuchuMainte_EditDtList" property="pageList"
					indexId="idx"  tabStartIndex="4" scope="session">
					<kit:tr>
						<%-- No. --%>
						<td class="nmView">
							<%= idx+1 %>
						</td>
						<%-- 発注商品 --%>
						<td class="mjView">
							<kit:write name="ediJuchuMainteDtRecord" property="mrSyohinCd" ignore="true" />:
							<kit:write name="ediJuchuMainteDtRecord" property="moSyohinNm" ignore="true" />
						</td>
						<%-- 許容日/ライフ --%>
						<td class="dtView">
							<kit:write name="ediJuchuMainteDtRecord" property="kyoyobi" ignore="true" format="yyyy/mm/dd"/>
						</td>
						<%-- 発注数 --%>
						<td class="nmView">
							<kit:write name="ediJuchuMainteDtRecord" property="mrSuryo" ignore="true" format="99,999"/>
						</td>
						<%-- 単位 --%>
						<td class="mjView">
							<kit:write name="ediJuchuMainteDtRecord" property="mrTani" ignore="true"
								decodeList="ediJuchuMainte_EdiTaniList" decodeWrite ="label"/>
						</td>
						<td class="mjView">
							<%-- 摘要 --%>
							<kit:write name="ediJuchuMainteDtRecord" property="mrTekiyou" ignore="true" />
						</td>
						<%-- Kz商品CD --%>
						<kit:td name="ediJuchuMainteDtRecord" property="shohinCdClass" styleClass="cdnView">
							<kit:text name="ediJuchuMainteDtRecord" property="shohinCd" maxlength="7" size="8"
								styleClass="text ime_off code frm_lpad right searchable"
								styleId="seihinCdLbl" readonly="false" tabindex="true" indexed="true"
								onkeyup="nextTabMaxLenInput()"
								onblur="ctrlInput(FRM_CLASS_PAD ,7 ,'0');setRefObjSyuka('popup','shohinCd',this,'shohinNm','shohinNmUriden','youkiNm','youkiKigoNm1');
								getValueByAjax(this,'shohinCd','shohinNmUriden,youkiKigoNm1');"
								onfocus="ctrlInput();setPreValueForAjax(this)"/>
						</kit:td>
						<%-- Kz商品名 --%>
						<kit:td name="ediJuchuMainteDtRecord" property="shohinCdClass" styleClass="mjView">
							<kit:text name="ediJuchuMainteDtRecord" property="shohinNmUriden" maxlength="20" size="46"
								styleClass="text ime_off left readonly"
								styleId="shohinNmUridenLbl" readonly="true" tabindex="false" indexed="true"
								onblur="ctrlInput()" onfocus="ctrlInput()"/>
						</kit:td>
						<%-- 容器名 --%>
						<kit:td name="ediJuchuMainteDtRecord" property="shohinCdClass" styleClass="mjView">
							<kit:text name="ediJuchuMainteDtRecord" property="youkiKigoNm1" maxlength="6" size="6"
								styleClass="text ime_off left readonly"
								styleId="youkiKigoNm1Lbl" readonly="true" tabindex="false" indexed="true"
								onblur="ctrlInput()" onfocus="ctrlInput()"/>
						</kit:td>
						<%-- ｹｰｽ --%>
						<kit:td name="ediJuchuMainteDtRecord" property="syukaSuCaseClass" styleClass="nmView">
							<kit:text name="ediJuchuMainteDtRecord" property="syukaSuCase" maxlength="5" size="6"
								styleClass="text ime_off number right"
								styleId="syukaSuCaseLbl" readonly="false" tabindex="true" indexed="true"
								onkeyup="nextTabMaxLenInput()" onblur="ctrlInput()" onfocus="ctrlInput()" />
						</kit:td>
						<%-- ﾊﾞﾗ --%>
						<kit:td name="ediJuchuMainteDtRecord" property="syukaSuBaraClass" styleClass="nmView">
							<kit:text name="ediJuchuMainteDtRecord" property="syukaSuBara" maxlength="5" size="6"
								styleClass="text ime_off number right"
								styleId="syukaSuBaraLbl" readonly="false" tabindex="true" indexed="true"
								onkeyup="nextTabMaxLenInput()" onblur="ctrlInput()" onfocus="ctrlInput()" />
						</kit:td>
						<%-- ｴﾗｰ区分 --%>
						<td class="mjView">
							<kit:write name="ediJuchuMainteDtRecord" property="errorKbn" ignore="true" />
						</td>
					</kit:tr>

					<%-- レコードのhidden要素（ディテール部） --%>
					<kit:hidden property="ktksyCd" indexed="true" name="ediJuchuMainteDtRecord" />
					<%-- エラー時フォーカス設定用hidden要素 --%>
					<kit:hidden property="shohinCdClass" indexed="true" name="ediJuchuMainteDtRecord" />
					<kit:hidden property="syukaSuBaraClass" indexed="true" name="ediJuchuMainteDtRecord" />
					<kit:hidden property="syukaSuCaseClass" indexed="true" name="ediJuchuMainteDtRecord" />
				</kit:iterate>
				<%-- リスト終了 --%>
			</table>
			</div>
		</div>
		<div class="list_bottom">
			<table id="footButtons">
				<tr>
					<td class="center">
						<%-- 確認ボタン --%>
						<kit:button styleClass="btn_large" property="btnConfirm"
								name="ediJuchuMainte_Edit" tabIndexProperty="tabIndexConfirm"
								onclick="if(eventPreSubmit()){setReqType('confirm');offUnloadConfirm();submit()}">
								<bean:message key="com.button.confirm" />
						</kit:button>
						<%-- 戻るボタン --%>
						<kit:button styleClass="btn_large" property="btnBack"
							name="ediJuchuMainte_Edit" tabIndexProperty="tabIndexBack"
							onclick="if(confirmBack(this)){if(eventPreSubmit()){setReqType('back');offUnloadConfirm();submit()}}">
							<bean:message key="com.button.back" />
						</kit:button>

						<%-- 印刷ボタン --%>
						<kit:button property="btnPrint" styleClass="btn_large" tabindex="0"
							kengenLevelProperty="kengenLevel" requiredKengenLevel="50"
							onclick="window.print();">
							<bean:message key="com.button.print" />
						</kit:button>
					</td>
				</tr>
			</table>
		</div>
	</kit:form>
	<%-- 照会・追加・更新・削除フォーム終了 --%>
	<hr />
	<%-- 共通フッター開始 --%>
	<%@ include file="/parts/comFooter.jsp"%>
	<%-- 共通フッター終了 --%>
	<%-- 検索条件入力フォーム開始 --%>
	<%-- 検索条件入力フォーム終了 --%>
</body>
</kit:html>