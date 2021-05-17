// 访问控制
/**
 * 访问级别
 *  open、public 级别可以让实体被同一模块源文件中的所有实体访问
 *  internal 级别让实体被统一模块源文件中的任何实体访问，但是不能被模块外的实体访问
 *  fileprivate 级别让实体只能在其定义的文件内部访问
 *  private 级别限制实体只能在其定义的作用域以及统一文件内的 extension 访问
 *
 * 访问级别基本原则
 *  实体不能定义在具有更低级别（更严格）的实体中
 */
public class somePublicClass {}
internal class someInternalClass {}
fileprivate class someFilePrivateClass {}
private class somaePrivateClass {}

// Getter 和 Setter
struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}
