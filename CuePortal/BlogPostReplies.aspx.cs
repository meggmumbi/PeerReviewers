using System;
using System.Linq;

namespace CicPortal
{
    public partial class BlogPostReplies : System.Web.UI.Page
    {
         public int blogId = 0;
            protected void Page_Load(object sender, EventArgs e)
            {
                blogId = Convert.ToInt32(Request.QueryString["blogId"]);
                LoadForums();
            }

            public void LoadForums()
            {
                var odataconn = Config.ReturnNav();

                var forumBlogs = odataconn.blogPosts.Where(r => r.Blog_Id == blogId).ToList()
                .OrderByDescending(m => m.Date_Created);
                foreach (var oneblog in forumBlogs)
                {
                    txtForumTitle.Text = oneblog.Blog_Title;
                    txtareaForumComment.Text = oneblog.Blog_Body;
                }
                }

                protected void btnSaveReply_OnClick(object sender, EventArgs e)
                {
                    var director = (string)Session["PeerCode"];
                    var dirName = Session["name"].ToString();
                    var myForumreply = txtForumReply.Text.Trim();

                    if (string.IsNullOrWhiteSpace(myForumreply))
                    {
                        forumfeedback.InnerHtml =
                        "<div class='alert alert-danger'>You can't save empty reply text, type something!</div>";
                        txtareaForumComment.Focus();
                        return;
                    }
                    var status = new Config().ObjNav().FnInsertBlogReply(myForumreply, director, dirName, blogId);
                    var info = status.Split('*');
                    forumfeedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
                    txtForumReply.Text = "";
                    }

    }
}
