package ${escapeKotlinIdentifiers(packageName)}

import android.os.Bundle
import androidx.recyclerview.widget.LinearLayoutManager
import com.xhs.baselibrary.base.BaseActivity
<#if applicationPackage??>
import ${applicationPackage}.R
</#if>
import kotlinx.android.synthetic.main.${activityLayoutName}.*

class ${className}Activity : BaseActivity(), ${className}Contact.I${className}View {

    private val m${className}Presenter by lazy { ${className}Presenter().apply { attachView(this@${className}Activity) } }

    private val n${className}Req = N${className}ModelReq()

    private val m${className}List = mutableListOf<${className}Item>()

    private lateinit var m${className}Adapter: ${className}Adapter

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.${activityLayoutName})
        initView()
        initData()
        initListener()
    }


    private fun initView() {
        m${className}Adapter = ${className}Adapter(m${className}List)
        rv${className}.layoutManager = LinearLayoutManager(this)
        rv${className}.adapter = m${className}Adapter
    }

    private fun initData() {
        m${className}Presenter.load${className}(n${className}Req)
    }

    private fun initListener() {
        swipe${className}.setOnRefreshListener {
            m${className}Presenter.load${className}(n${className}Req)
        }
    }

    override fun load${className}Success(mList: List<${className}Item>) {
        swipe${className}.isRefreshing = false
        m${className}List.clear()
        m${className}List.addAll(mList)
        m${className}Adapter.notifyDataSetChanged()

    }

    override fun load${className}Fail(throwable: Throwable) {
        handleError(throwable)
        swipe${className}.isRefreshing = false
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