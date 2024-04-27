Class {
	#name : #WsToDoItemView,
	#superclass : #WsView,
	#category : #'WebSt-Examples-ToDoList'
}

{ #category : #rendering }
WsToDoItemView >> renderOuterHtmlOn: html [

	html checkbox class: 'form-check-input todo-checkbox'.
	html
		render: WsEditableTextComponent
		style: 'display:inline-block; margin-left:10px;'
]
