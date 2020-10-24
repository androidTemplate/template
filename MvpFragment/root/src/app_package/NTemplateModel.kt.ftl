package ${escapeKotlinIdentifiers(packageName)}
class N${className}Response(
    val code: Int = -1,
    val message: String = "",
    val data: Data = Data()
) {
    class Data
}
class N${className}ModelReq