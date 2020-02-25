package ${escapeKotlinIdentifiers(packageName)}

import com.chad.library.adapter.base.BaseQuickAdapter
import com.chad.library.adapter.base.BaseViewHolder
<#if applicationPackage??>
import ${applicationPackage}.R
</#if>

class ${className}Adapter(mList:List<${className}Item>):BaseQuickAdapter<${className}Item,BaseViewHolder>(R.layout.${itemLayoutName},mList) {
    override fun convert(helper: BaseViewHolder?, item: ${className}Item?) {

    }
}