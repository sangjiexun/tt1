package kit.edi.SdnCenterCode;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import fb.com.exception.KitComException;
import fb.inf.KitFunction;

/**
 * 99911_1_1　SDNｾﾝﾀｰｺｰﾄﾞ送受信

 *
 * @author Tuneduka
 *
 */
public class EdiSdnCenterCode_SearchFunction extends KitFunction {

	/** シリアルID */
	private static final long serialVersionUID = -9213030916375499372L;


	// -----------------------------------------
	// create log4j instance & Config LogLevel
	// -----------------------------------------
	private static String className__ = EdiSdnCenterCode_SearchFunction.class.getName();

	/**
	 * トランザクション管理を行うかどうかを示すフラグです。 trueの場合トランザクション管理を行います。falseの場合トランザクション管理を行いません。
	 *
	 * @see #isTransactionalFunction ()
	 */
	private final boolean isTransactionalFunction = false;

	@Override
	protected boolean isTransactionalFunction() {
		return isTransactionalFunction;
	}

	@Override
	protected String getFunctionName() {
		return className__;
	}

	/**
	 * コンストラクタです。
	 * @param mapping paramName
	 * @param form paramName
	 * @param request paramName
	 * @param response paramName
	 */
	public EdiSdnCenterCode_SearchFunction(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		super(mapping, form, request, response);
	}

	/**
	 * メインメソッドです。 リクエストタイプの判別,検索条件のチェック,検索および検索結果のビーンへのセットを行います。
	 *
	 * @return 処理結果を表す文字列(FORWARD_SUCCESS,FORWARD_FAIL)
	 * @throws KitComException
	 */
	@Override
	protected String execute_() throws KitComException {

		String sForwardPage = FORWARD_SUCCESS;

		return sForwardPage;
	}



}
