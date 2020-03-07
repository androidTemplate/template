package ${escapeKotlinIdentifiers(packageName)}
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.LinearLayoutManager
<#if applicationPackage??>
import ${applicationPackage}.R
</#if>
import kotlinx.android.synthetic.main.${fragmentLayoutName}.*
import com.xhs.baselibrary.base.BaseFragment

class ${className}Fragment : BaseFragment(), ${className}Contact.I${className}View {

    private val m${className}Presenter by lazy { ${className}Presenter().apply { attachView(this@${className}Fragment) } }

    private val n${className}Req = N${className}ModelReq()

    private val m${className}List = mutableListOf<${className}Item>()

    private lateinit var m${className}Adapter: ${className}Adapter

     private var totalCount = 0


     override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return LayoutInflater.from(context).inflate(R.layout.${fragmentLayoutName}, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        initView()
        initData()
        initListener()
    }


    private fun initView() {
        m${className}Adapter = ${className}Adapter(m${className}List)
        rv${className}.layoutManager = LinearLayoutManager(context)
        rv${className}.adapter = m${className}Adapter
    }

    private fun initData() {
        m${className}Presenter.load${className}(n${className}Req)
    }

    private fun initListener() {
        swipe${className}.setOnRefreshListener {
            m${className}Presenter.load${className}(n${className}Req)
        }
         m${className}Adapter.setOnLoadMoreListener({
            if (n${className}Req.pageIndex * n${className}Req.pageSize < totalCount) {
                m${className}Presenter.load${className}(n${className}Req)
            } else {
                m${className}Adapter.loadMoreEnd()
            }
        }, rv${className})
    }

    override fun load${className}Success(mList: List<${className}Item>,totalCount:Int) {
       if (n${className}Req.pageIndex == 1) {
            m${className}List.clear()
        }
         this.totalCount=totalCount
        m${className}List.addAll(mList)
        m${className}Adapter.notifyDataSetChanged()
        m${className}Adapter.loadMoreComplete()
        swipe${className}.isRefreshing = false
        n${className}Req.pageIndex++

    }

    override fun load${className}Fail(throwable: Throwable) {
         handleError(throwable)
        swipe${className}.isRefreshing
        m${className}Adapter.loadMoreComplete()
    }

    override fun showLoading() {
        showProgressDialog()
    }

    override fun hideLoading() {
        hideProgressDialog()
    }
    companion object {
        fun getInstance() = ${className}Fragment().apply { 
            arguments = Bundle().apply {
                
            }
        }
    }
}