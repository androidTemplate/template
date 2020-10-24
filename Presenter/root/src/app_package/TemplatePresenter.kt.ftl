package ${escapeKotlinIdentifiers(packageName)}

import com.xhs.baselibrary.base.IPresenter
import com.xhs.baselibrary.net.retrifit.RetrofitUtils
import com.xhs.baselibrary.net.util.RxUtils
<#if applicationPackage??>
import ${applicationPackage}.api.${className}Api
</#if>


class ${className}Presenter :IPresenter<${className}Contact.I${className}View>(),${className}Contact.I${className}Presenter{
    override fun load${className}(n${className}ModelReq: N${className}ModelReq) {
        RetrofitUtils.getRetrofit()
            .create(${className}Api::class.java)
            .load${className}(n${className}ModelReq)
            .compose(RxUtils.getSchedulerTransformer())
            .compose(RxUtils.bindToLifecycle(softView.get()))
            .doOnSubscribe { disposable ->
                addDisposable(disposable)
                softView.get()?.showLoading()
            }.doFinally {
                softView.get()?.hideLoading()
            }
            .subscribe(
                {
                    if (it.code == 0){
                        softView.get()?.load${className}Success(it)
                    } else {
                        softView.get()?.load${className}Fail(Throwable(it.message))
                    }
                    //这里面是回调成功的方法
                }, { throwable -> softView.get()?.load${className}Fail(throwable) }
            )
    }
}