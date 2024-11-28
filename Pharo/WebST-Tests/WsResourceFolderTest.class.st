Class {
	#name : 'WsResourceFolderTest',
	#superclass : 'TestCase',
	#instVars : [
		'resourceFolder',
		'savedRootPath',
		'classFactory'
	],
	#category : 'WebST-Tests-Resources',
	#package : 'WebST-Tests',
	#tag : 'Resources'
}

{ #category : 'tests' }
WsResourceFolderTest >> assertFullPathFrom: relativePath [

	| rootPath actualPath |
	rootPath := resourceFolder rootPath.
	actualPath := resourceFolder fullPathFrom: relativePath.
	self assert: (actualPath beginsWith: rootPath).
	self assert: (actualPath endsWith: relativePath).
	self deny: (actualPath includesSubstring: '//')
]

{ #category : 'tests' }
WsResourceFolderTest >> assertPathToResources [

	{ ''. '/'. 'image.jpg'. '/sound.mp3'. 'my/js/folder/lib.js'.
	'/path/with/leading/slash/' } do: [ :each |
		self assertFullPathFrom: each ]
]

{ #category : 'tests' }
WsResourceFolderTest >> assertResourceFullPath [

	| path resource |
	path := 'path/to/css/theme.css'.
	resource := WsCssLink pathString: path.
	self assert: resource pathString equals: (resourceFolder fullPathFrom: path)
]

{ #category : 'tests' }
WsResourceFolderTest >> assertRootPath: path [

	| actualPath |
	actualPath := resourceFolder rootPath.
	self deny: actualPath isNil.
	self deny: actualPath isEmpty.
	self assert: (actualPath beginsWith: path).
	self assert: actualPath last equals: $/.
	self assertPathToResources
]

{ #category : 'tests' }
WsResourceFolderTest >> newAppClass [

	| appClass appFolder |
	appClass := classFactory make: [ :builder |
		            builder
			            superclass: PjWebApplication;
			            traits: { WsTApp } ].
	appClass class compileSilently:
		'renderContentOn: html <pharoJsSkip> ^self'.
	appFolder := '/tmp/WebST/ResourceFolderTest' asFileReference
		             ensureCreateDirectory.
	appClass appFolder: appFolder.
	^ appClass
]

{ #category : 'tests' }
WsResourceFolderTest >> setUp [

	super setUp.
	savedRootPath := WsResourceFolder rootPath.
	WsResourceFolder resetDefault.
	resourceFolder := WsResourceFolder default.
	classFactory := ClassFactoryForTestCase new
]

{ #category : 'tests' }
WsResourceFolderTest >> tearDown [

	classFactory cleanUp.
	WsResourceFolder resetDefault.
	WsResourceFolder rootPath: savedRootPath.
	super tearDown
]

{ #category : 'tests' }
WsResourceFolderTest >> testAppCustomizingRootPath [

	| appClass customRootPath methodSource |
	appClass := self newAppClass.
	customRootPath := '/my/custom/root/path/'.
	methodSource := String streamContents: [ :str |
		                str
			                << 'resourceRootPath';
			                cr;
			                << $^;
			                print: customRootPath ].
	appClass class compileSilently: methodSource.
	appClass exportApp.
	self assert: resourceFolder rootPath equals: customRootPath.
	self assertResourceFullPath
]

{ #category : 'tests' }
WsResourceFolderTest >> testAppDefaultRootPath [

	| appClass  |
	appClass := self newAppClass.
	appClass exportApp.
	self assert: resourceFolder rootPath equals: WsResourceFolder defaultRootPath.
	self assertResourceFullPath
]

{ #category : 'tests' }
WsResourceFolderTest >> testAppSetsResourcePathBeforeExport [

	| appClass  |
	appClass := self newAppClass.
	appClass beforeExportApp.
	self assert: resourceFolder rootPath equals: WsResourceFolder defaultRootPath.
	self assertResourceFullPath
]

{ #category : 'tests' }
WsResourceFolderTest >> testCustomRootPath [

	#( '' '.' '..' 'some/path/' '/path/not/ending/with/slash' ) do: [
		:path |
		resourceFolder rootPath: path.
		self assertRootPath: path ]
]

{ #category : 'tests' }
WsResourceFolderTest >> testDefaultRootPath [

	self assertRootPath: WsResourceFolder defaultRootPath.

]

{ #category : 'tests' }
WsResourceFolderTest >> testLocalResourceUrl [

	self assertResourceFullPath
]

{ #category : 'tests' }
WsResourceFolderTest >> testRemoteResourceUrl [

	| url resource |
	url := 'http://some.site.com/path/to/css/theme.css'.
	resource := WsCssLink fixedPathString: url.
	self assert: resource pathString equals: url
]
