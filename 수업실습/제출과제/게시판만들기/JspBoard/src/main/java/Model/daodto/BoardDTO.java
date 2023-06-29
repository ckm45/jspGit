package Model.daodto;

public class BoardDTO {
    private int id;
    private String name;
    private String title;
    private String content;
    private String date;
    private int group;
    private int level;
    private int indent;
    private int view;
    
    
    
    
    public BoardDTO(int id, String name, String title, String content, String date, int group,
            int level, int indent, int view) {
        super();
        this.id = id;
        this.name = name;
        this.title = title;
        this.content = content;
        this.date = date;
        this.group = group;
        this.level = level;
        this.indent = indent;
        this.view = view;
    }
    
    public BoardDTO(String name, String title, String content) {
        super();
        this.id = 0;
        this.name = name;
        this.title = title;
        this.content = content;
        this.date = null;
        this.group = 0;
        this.level = 0;
        this.indent = 0;
        this.view = 0;
    }
    
    
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }
   
    public int getGroup() {
        return group;
    }

    public void setGroup(int group) {
        this.group = group;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public int getIndent() {
        return indent;
    }

    public void setIndent(int indent) {
        this.indent = indent;
    }

    public int getView() {
        return view;
    }
    public void setView(int view) {
        this.view = view;
    }
    
    
        
    
    
    }
