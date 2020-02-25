package ${escapeKotlinIdentifiers(packageName)}

import android.os.Bundle
import com.xhs.baselibrary.base.BaseActivity
<#if applicationPackage??>
import ${applicationPackage}.R
</#if>
import kotlinx.android.synthetic.main.${activityLayoutName}.*

class ${className}Activity : BaseActivity(), ${className}Contact.I${className}View {

    private val m${className}Presenter by lazy { ${className}Presenter().apply { attachView(this@${className}Activity) } }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.${activityLayoutName})
        initView()
        initData()
        initListener()
    }


    private fun initView() {
        
    }

    private fun initData() {
        m${className}Presenter.load${className}("")
    }

    private fun initListener() {
       
    }

    override fun load${className}Success(content: Any) {
        

    }

    override fun load${className}Fail(throwable: Throwable) {
        handleError(throwable)
    }

    override fun showLoading() {
        showProgressDialog()
    }

    override fun hideLoading() {
        hideProgressDialog()
    }
    companion object {
        fun getInstance() = Bundle().apply { }
    }
}