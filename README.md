# DJRefresh

### How to use

##### 添加下拉刷新

```swift
tableView.addHeader { [weak self] in
  // TODO
  刷新逻辑
}
```

##### 添加上拉刷新

```swift
tableView.addFooter { [weak self] in
  刷新逻辑
}
```

