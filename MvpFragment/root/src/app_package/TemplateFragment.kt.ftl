package ${escapeKotlinIdentifiers(packageName)}

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
<#if applicationPackage??>
import ${applicationPackage}.R
</#if>
import kotlinx.android.synthetic.main.${fragmentLayoutName}.*
import com.xhs.baselibrary.base.BaseFragment

class ${className}Fragment : Fragment(), ${className}Contact.I${className}View {

    private val m${className}Presenter by lazy { ${className}Presenter().apply { attachView(this@${className}Fragment) } }

  

   override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return LayoutInflater.from(context).inflate(R.layout.fragmentLayoutName,container,false)
    }
	
	 override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
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
        fun getInstance() = ${className}Fragment().apply {
            arguments = Bundle().apply { }
        }
    }
}