Class {
	#name : #WsToDoItemView,
	#superclass : #WsView,
	#category : #'WebST-Examples-ToDoList'
}

{ #category : #rendering }
WsToDoItemView >> renderOuterHtmlOn: html [

	html checkbox class: 'form-check-input todo-checkbox'.
	html
		render: WsTextToggleEditComponent
		style: 'display:inline-block; margin-left:10px;'
]
