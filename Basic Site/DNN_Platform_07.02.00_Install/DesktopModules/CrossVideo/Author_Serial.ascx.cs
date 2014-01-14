using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cross.DNN.Common.A3;
using Cross.DNN.Common.UserDefinedTable;
using Cross.DNN.Common.Utility;
using Cross.DNN.Common.Utility.TreeHelper;
using Cross.Modules.Video.Business;
using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Services.FileSystem;
using DotNetNuke.Services.Localization;
using DotNetNuke.UI.Skins.Controls;
namespace Cross.Modules.Video.View
{

    public partial class Author_Serial : VideoModuleBase
    {
        #region private fields
        private EditControls ListEditControls;
        private List<UDFieldInfo> TypeUdtList
        {
            get
            {
                List<UDFieldInfo> list = (from p in Cache_UdtList where p.TypeId == TypeId select p).ToList();
                return list;
            }
        }
        private int TypeId
        {
            get
            {
                if (ViewState["TypeId"] != null)
                {
                    return Convert.ToInt32(ViewState["TypeId"]);
                }
                else
                {
                    return -1;
                }
            }
            set
            {
                ViewState["TypeId"] = value;
            }
        }

        private int CurrentPage
        {
            get
            {
                if (ViewState["CurrentPage"] != null)
                {
                    return Convert.ToInt32(ViewState["CurrentPage"]);
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                ViewState["CurrentPage"] = value;
            }
        }
        private string CurrentTarget
        {
            get
            {
                if (ViewState["CurrentTarget"] != null)
                {
                    return Convert.ToString(ViewState["CurrentTarget"]);
                }
                else
                {
                    return "Serial";
                }
            }
            set
            {
                ViewState["CurrentTarget"] = value;
            }
        }
        private int SerialId
        {
            get
            {
                if (ViewState["SerialId"] != null)
                {
                    return Convert.ToInt32(ViewState["SerialId"]);
                }
                else
                {
                    return -1;
                }
            }
            set
            {
                ViewState["SerialId"] = value;
            }
        }
        private int VideoId
        {
            get
            {
                if (ViewState["VideoId"] != null)
                {
                    return Convert.ToInt32(ViewState["VideoId"]);
                }
                else
                {
                    return -1;
                }
            }
            set
            {
                ViewState["VideoId"] = value;
            }
        }


        private int ImageId
        {
            get
            {
                if (ViewState["ImageId"] != null)
                {
                    return Convert.ToInt32(ViewState["ImageId"]);
                }
                else
                {
                    return -1;
                }
            }
            set
            {
                ViewState["ImageId"] = value;
            }
        }
        #endregion
        #region public properties
        public bool HasManagePermission
        {
            get
            {
                return UserInfo.IsInRole(PortalSettings.AdministratorRoleName);
            }
        }
        public TypeInfo CurrentType
        {
            get
            {
                if (TypeId != -1)
                {
                    return TypeController.Get(TypeId);
                }
                else
                {
                    return new TypeInfo();
                }
            }
        }
        #endregion
        #region user defined fields
        private void BuildUDFieldForm()
        {
            List<UDFieldInfo> list = (from p in Cache_UdtList where p.TypeId == TypeId select p).ToList();
            if (list.Count < 1)
            {
                if (tblUserDefinedField.Visible == true)
                {
                    tblUserDefinedField.Rows.Clear();
                    tblUserDefinedField.Visible = false;
                }
                return;
            }
            List<FormColumnInfo> listEditFrom = new List<FormColumnInfo>();
            FormColumnInfo objColumn;
            ListEditControls = new EditControls(ModuleContext);

            foreach (UDFieldInfo objUDField in list)
            {
                objColumn = new FormColumnInfo();
                objColumn.Name = objUDField.FieldName;
                objColumn.IsUserDefinedField = true;
                objColumn.Help = objUDField.HelpText;
                objColumn.Title = (objUDField.FieldTitle == null || objUDField.FieldTitle.Trim() == "") ? objUDField.FieldName : objUDField.FieldTitle;
                objColumn.Required = objUDField.Required;
                objColumn.Visible = true;
                objColumn.EditControl = ListEditControls.Add(objColumn.Name, objColumn.Title, objUDField.FieldType, objUDField.Id, objColumn.Help, objUDField.DefaultValue, objColumn.Required,
                    objUDField.ValidationRule, objUDField.ValidationMessage, objUDField.EditStyle, objUDField.InputSettings, objUDField.OutputSettings, objUDField.NormalizeFlag);
                listEditFrom.Add(objColumn);
            }
            BuildFormAsTable(listEditFrom);
        }
        private void BuildFormAsTable(List<FormColumnInfo> listEditFrom)
        {
            tblUserDefinedField.Visible = true;
            tblUserDefinedField.Rows.Clear();
            foreach (FormColumnInfo objColumn in listEditFrom)
            {
                TableRow objRow = new TableRow();
                //1st column: Caption for the field
                TableCell objCell = new TableCell();
                objCell.VerticalAlign = VerticalAlign.Top;
                objCell.Controls.Add(GetTitleControl(objColumn.Title, objColumn.Help, objColumn.Required));
                if (objColumn.EditControl == null)
                {
                    objCell.ColumnSpan = 2;
                    objRow.Cells.Add(objCell);
                }
                else
                {
                    objCell.CssClass = "Normal";
                    objCell.Width = Unit.Pixel(150);
                    objRow.Cells.Add(objCell);


                    //3rd column: Dynamic control
                    objCell = new TableCell();
                    objCell.VerticalAlign = VerticalAlign.Top;
                    objCell.Controls.Add(objColumn.EditControl);
                    objCell.Width = Unit.Percentage(80);
                    //row visibility:
                    objRow.Cells.Add(objCell);
                    objRow.Visible = true;
                }
                tblUserDefinedField.Rows.Add(objRow);
            }
        }
       
        private void UpdateUserDefinedData(int videoId)
        {
            if (TypeUdtList.Count > 0)
            {
                UDDataInfo objUDData = new UDDataInfo();
                objUDData.VideoId = videoId;
                foreach (EditControl item in ListEditControls.Values)
                {
                    objUDData.FieldId = item.FieldID;
                    objUDData.FieldValue = item.Value;
                    UDDataController.Update(objUDData);
                }
            }
        }
        private void CopyUserDefinedData(int originalVideoId, int newVideoId)
        {
            if (TypeUdtList.Count > 0)
            {
                UDDataController.CopyUserDefinedData(originalVideoId, newVideoId);
            }
        }
        private void BindUserDefinedData(int videoId)
        {
            if (TypeUdtList.Count > 0)
            {
                List<UDDataInfo> listUDData = UDDataController.GetByVideo(videoId);

                foreach (UDDataInfo objData in listUDData)
                {
                    UDFieldInfo objField = UDFieldController.Get(objData.FieldId);
                    if (objField != null && objData.FieldValue != null && ListEditControls[objField.FieldName] != null)
                   // if (ListEditControls[objField.FieldName] != null)
                    {
                        ListEditControls[objField.FieldName].Value = objData.FieldValue;
                    }

                }
            }
        }
        #endregion

        #region event handler
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterScriptAndCss();

            lbtnCalendar.NavigateUrl = DotNetNuke.Common.Utilities.Calendar.InvokePopupCal(txtPublishDate);
            lbtnCalendarExpire.NavigateUrl = DotNetNuke.Common.Utilities.Calendar.InvokePopupCal(txtExpireDate);
            if (!IsPostBack)
            {
                CheckSecurity();
                ddlType.DataSource = Cache_TypeList;
                ddlType.DataBind();
                TypeId = Convert.ToInt32(ddlType.SelectedValue);
                SerialId = -1;
                BindControl();
                LoadCategories();
                BindTag();
                BindSerialList();
                CurrentTarget = "Serial";
                SetLayout("ViewSerialList");
                DataBind();
            }
            BuildUDFieldForm();
        }
        protected string GetVideoUrl(string videoId)
        {
            int tab = TabId;
            VideoInfo objVideo = VideoController.Get(Convert.ToInt32(videoId));
            if (objVideo != null)
            {
                TypeInfo objType = TypeController.Get(objVideo.TypeId);
                if (objType.DetailPage != DotNetNuke.Common.Utilities.Null.NullInteger)
                {
                    tab = objType.DetailPage;
                }
            }
            return GenerateVideoDetailUrl(tab, videoId, objVideo.Title);
        }
        private void CheckXhtml()
        {
            Control ctlDocType = BasePage.FindControl("skinDocType");//light box video needs xhtml doctype
            if (ctlDocType != null)
            {
                System.Web.UI.WebControls.Literal lit = (System.Web.UI.WebControls.Literal)ctlDocType;
                lit.Text = @"<!DOCTYPE html
                            PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN'
                            'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'> ";

            }
        }
        private void RegisterScriptAndCss()
        {
            CheckXhtml();
            DotNetNuke.Framework.jQuery.RequestUIRegistration();
            StringBuilder sb = new StringBuilder();
            //Jquery ui
            sb.AppendFormat("<link rel=\"stylesheet\" href=\"{0}/desktopmodules/CrossVideo/css/jquery/flickr/jquery-ui-1.8.2.custom.css\" type=\"text/css\"  />{1}", FullDomainName, "\r\n");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Cp_Detail_Script", sb.ToString());
        }
        //设定控件的初始状态
        private void BindControl()
        {
            lblVideoQuota.Text =
            string.Format(Localization.GetString("lblVideoQuota", LocalResourceFile),
            GetUserItemCountLimt_Video(UserId) == LocalUtils.ItemCount_Unlimited ?
            Localization.GetString("Unlimited", LocalUtils.ResourcesFile_Shared) : GetUserItemCountLimt_Video(UserId).ToString(),
            VideoController.GetItemCount(PortalId, UserId).ToString());

            lbl_Tip_SelectCategory.Text = string.Format(Localization.GetString("Tip_SelectCategory", LocalResourceFile),
            Settings_Portal.General.CategorySelectCount.ToString());

            ctlPagingControl.ResourceFile = LocalUtils.ResourcesFile_Shared;//绑定资源文件

            string fileStorage = Settings_Portal.General.FileStorage;
            string uploadUrl = Settings_Portal.General.FileStorage == LocalUtils.FileStorage_A3 ? EditUrl("Author_A3File") : EditUrl("Author_LocalFileUpload");

         

            ctlImage.ShowControlBar = InFileManageRoles;
            ctlImage.ShowFile = InFileManageRoles;
            ctlImage.ShowEmbed = false;
            ctlImage.ShowUrl = true;
            ctlImage.ShowThumbnailImage = false;
            ctlImage.StorageMode = fileStorage;
            ctlImage.UploadUrl = uploadUrl;
            ctlImage.Local_FolderRootPrefix = Settings_Portal.Local.UserFolderRoot;

            ctlAttachment.ShowControlBar = InFileManageRoles;
            ctlAttachment.ShowFile = InFileManageRoles;
            ctlAttachment.ShowEmbed = false;
            ctlAttachment.ShowUrl = true;
            ctlAttachment.ShowThumbnailImage = true;
            ctlAttachment.StorageMode = fileStorage;
            ctlAttachment.UploadUrl = uploadUrl;
            ctlAttachment.Local_FolderRootPrefix = Settings_Portal.Local.UserFolderRoot;

            ctlVideoFile.ShowControlBar = true;
            ctlVideoFile.ShowFile = InFileManageRoles;
            ctlVideoFile.ShowEmbed = true;
            ctlVideoFile.ShowUrl = true;
            ctlVideoFile.ShowThumbnailImage = true;
            ctlVideoFile.StorageMode = fileStorage;
            ctlVideoFile.UploadUrl = uploadUrl;
            ctlVideoFile.Local_FolderRootPrefix = Settings_Portal.Local.UserFolderRoot;
            ctlVideoFile.FileFilter = CurrentType.MediaType == Convert.ToInt32(MediaType.Video) ? "mp4,m4v,f4v,mov,flv,webm" : "aac,m4a,f4a,mp3,ogg,oga";
            //ctlVideoFile.FileFilter = CurrentType.MediaType == Convert.ToInt32(MediaType.Video) ? "Flv,Mp4,Swf" : "Mp3";

            ctlVideoImage.ShowControlBar = InFileManageRoles;
            ctlVideoImage.ShowFile = InFileManageRoles;
            ctlVideoImage.ShowEmbed = false;
            ctlVideoImage.ShowUrl = true;
            ctlVideoImage.ShowThumbnailImage = false;
            ctlVideoImage.StorageMode = fileStorage;
            ctlVideoImage.UploadUrl = uploadUrl;
            ctlVideoImage.Local_FolderRootPrefix = Settings_Portal.Local.UserFolderRoot;

            ctlImageFile.ShowControlBar = InFileManageRoles;
            ctlImageFile.ShowFile = InFileManageRoles;
            ctlImageFile.ShowEmbed = false;
            ctlImageFile.ShowUrl = true;
            ctlImageFile.ShowThumbnailImage = false;
            ctlImageFile.StorageMode = fileStorage;
            ctlImageFile.UploadUrl = uploadUrl;
            ctlImageFile.Local_FolderRootPrefix = Settings_Portal.Local.UserFolderRoot;

            if (InFileManageRoles)
            {
                ctlImageFolder.ShowFolderListOnly = true;
                ctlImageFolder.StorageMode = fileStorage;
                ctlImageFolder.Local_FolderRootPrefix = Settings_Portal.Local.UserFolderRoot;
                ctlImageFolder.ShowThumbnailImage = false;

                ctlVideoFolder.ShowFolderListOnly = true;
                ctlVideoFolder.StorageMode = fileStorage;
                ctlVideoFolder.Local_FolderRootPrefix = Settings_Portal.Local.UserFolderRoot;
                ctlVideoFolder.FileFilter = CurrentType.MediaType == Convert.ToInt32(MediaType.Video) ? "mp4,m4v,f4v,mov,flv,webm" : "aac,m4a,f4a,mp3,ogg,oga";
            }


            lblPortalDisableComment.Visible = !Settings_Portal.Comment.AllowComment;
            lblPortalDisableRating.Visible = !Settings_Portal.Rating.AllowRating;
            lblPortalDisableRecommend.Visible = !Settings_Portal.Recommend.AllowRecommend;

            txtDisplayOrder.Text = "1000";

            txtPublishDate.Text = DateTime.Now.ToShortDateString();
            chkAuthed.Checked = !Settings_Portal.General.VideoRequireApproval;

            //ViewRoles
            cblViewRoles = Cross.DNN.Common.Utility.Utils.FillRolesCheckBox(cblViewRoles, Settings_Portal.General.VideoViewRoles, PortalSettings.AdministratorRoleId, PortalId);

            //Rating value
            chkAllowRating.Checked = Settings_Portal.Rating.AllowRating;
            cblRatingRoles = Cross.DNN.Common.Utility.Utils.FillRolesCheckBox(cblRatingRoles, Settings_Portal.Rating.RatingRoles, PortalSettings.AdministratorRoleId, PortalId);

            //Recommend
            chkAllowRecommend.Checked = Settings_Portal.Recommend.AllowRecommend;
            cblRecommendRoles = Cross.DNN.Common.Utility.Utils.FillRolesCheckBox(cblRecommendRoles, Settings_Portal.Recommend.RecommendRoles, PortalSettings.AdministratorRoleId, PortalId);
            //Comment value
            chkAllowComment.Checked = Settings_Portal.Comment.AllowComment;
            chkAutoAuthComment.Checked = Settings_Portal.Comment.AutoAuthComment;
            cblCommentRoles = Cross.DNN.Common.Utility.Utils.FillRolesCheckBox(cblCommentRoles, Settings_Portal.Comment.CommentRoles, PortalSettings.AdministratorRoleId, PortalId);
            //attachment download roles
            cblDownloadRoles = Cross.DNN.Common.Utility.Utils.FillRolesCheckBox(cblDownloadRoles, Settings_Portal.Download.DownloadRoles, PortalSettings.AdministratorRoleId, PortalId);

            BindUserGroups();
        }
        private void BindUserGroups()
        {
            //如果当前为super user,则只列出当前super user 所创建的group,其他用户则判断当前用户是否属于该group
            //这么做的原因是UserInfo.IsInRole(grp.RoleName) 这个判断当super user  时完全不起作用
            IList<DotNetNuke.Security.Roles.RoleInfo> roles = DotNetNuke.Security.Roles.Internal.TestableRoleController.Instance.GetRoles(PortalId,
                                                (grp) => grp.SecurityMode != DotNetNuke.Security.Roles.SecurityMode.SecurityRole
                                                            && grp.Status == DotNetNuke.Security.Roles.RoleStatus.Approved
                                                            && (UserInfo.IsSuperUser ? grp.CreatedByUserID == UserId : UserInfo.IsInRole(grp.RoleName))
                                        );
            if (roles.Count > 0)
            {
                cblGroups.DataTextField = "RoleName";
                cblGroups.DataValueField = "RoleId";
                cblGroups.DataSource = roles;
                cblGroups.DataBind();
                lblNoGroup.Visible = false;
                cblGroups.Visible = true;
            }
            else
            {
                lblNoGroup.Visible = true;
                cblGroups.Visible = false;
            }
        }
        private void BindTag()
        {
            txtTag2.Visible = Settings_Portal.General.TagSelectCount > 1;
            txtTag3.Visible = Settings_Portal.General.TagSelectCount > 2;
            txtTag4.Visible = Settings_Portal.General.TagSelectCount > 3;
            txtTag5.Visible = Settings_Portal.General.TagSelectCount > 4;
            txtTag6.Visible = Settings_Portal.General.TagSelectCount > 5;
            txtTag7.Visible = Settings_Portal.General.TagSelectCount > 6;
            txtTag8.Visible = Settings_Portal.General.TagSelectCount > 7;
            txtTag9.Visible = Settings_Portal.General.TagSelectCount > 8;
            txtTag10.Visible = Settings_Portal.General.TagSelectCount > 9;

            List<TagInfo> tagList = TagController.GetByType(TypeId);
            var popularList = from p in tagList orderby p.VideoCounts descending select new { Tag = p.Tag };
            ddlPopularTag.DataSource = popularList.Take(45);
            ddlPopularTag.DataBind();

        }

        private void CheckSecurity()
        {
            if (TrialExpired)
            {
                Response.Redirect(DotNetNuke.Common.Globals.NavigateURL(TabId), true);
            }
            if (Cache_TypeList.Count < 1)
            {
                Response.Redirect(DotNetNuke.Common.Globals.NavigateURL(TabId), true);
            }
            //检查是否为每个type 都设置了category
            foreach (TypeInfo item in Cache_TypeList)
            {
                if ((from p in Cache_CategoryList where p.TypeId == item.Id select p).ToList().Count < 1)
                {
                    Response.Redirect(DotNetNuke.Common.Globals.NavigateURL(TabId), true);
                }
            }
            if (InEditRoles_CurrentUser_Video)
            {
                return;
            }
            Response.Redirect(DotNetNuke.Common.Globals.NavigateURL("Access Denied"), true);
        }
        #endregion
        #region TreeView

        private void LoadCategories()
        {
            List<CategoryInfo> validList = (from p in Cache_CategoryList where p.TypeId == TypeId select p).ToList();
            //转换目录信息列表至树形节点列表
            List<RecursiveCategoryData> listRecursive = LocalUtils.ConvertCategoryListToRecursiveList(validList);
            RecursiveCategoryItem m_recursiveCategoryRoot;
            m_recursiveCategoryRoot = RecursiveHelper.ConvertListToRecursiveItem(listRecursive);


            RecursiveHelper.ConvertRecursiveItemToAspNetTree(ref this.tvCategory, m_recursiveCategoryRoot);

            List<CategoryInfo> list = CategoryController.GetByType(TypeId);


            for (int i = 0; i < list.Count; i++)
            {
                list[i].Name = Cross.DNN.Common.Utility.Utils.FormatLevelName(list[i].Name, list[i].Level, "..");
            }

            List<RecursiveCategoryData> listRecursiveData = new List<RecursiveCategoryData>();
            listRecursiveData = LocalUtils.ConvertCategoryListToRecursiveList(list);


            RecursiveCategoryItem orderedItems = RecursiveHelper.ConvertListToRecursiveItem(listRecursiveData);

            ArrayList listCategory = orderedItems.GetListOrdered();
            RecursiveCategoryItem a = new RecursiveCategoryItem();
            a.Id = -1;
            a.Name = "<" + DotNetNuke.Services.Localization.Localization.GetString("None_Specified") + ">";
            listCategory.Add(a);
            ddlCategory.DataSource = listCategory;
            ddlCategory.DataBind();
            ddlCategory.SelectedValue = "-1";
        }



        #endregion

        #region  helper method
        private void BindVideo(int videoId)
        {
            VideoInfo objVideo = VideoController.Get(videoId);
            if (objVideo == null)
            {
                return;
            }

            txtVideoTitle.Text = objVideo.Title;
            ctlVideoFile.Url = objVideo.VideoFile;
            if (ddlHttpType.Items.FindByValue(objVideo.HttpType) != null)
            {
                ddlHttpType.SelectedIndex = -1;
                ddlHttpType.Items.FindByValue(objVideo.HttpType).Selected = true;
            }

            txtVideoDuration.Text = objVideo.Duration;

            ctlVideoImage.Url = objVideo.Image;
            txtSerialOrder.Text = objVideo.SerialOrder.ToString();
        }
        private void BindSerial(int serialId)
        {
            VideoInfo objVideo = VideoController.Get(serialId);
            if (objVideo == null)
            {
                return;
            }

            txtSerialTitle.Text = objVideo.Title;
         
            txtAuthor.Text = objVideo.Author;
            txtSource.Text = objVideo.Source;
            chkQuote.Checked = objVideo.Quote;
            txtDisplayOrder.Text = Convert.ToString(objVideo.DisplayOrder);
            //chkPrivate.Checked = objVideo.Private;
            //chkProtected.Checked = objVideo.Protected;
            txtProtectPassword.Text = objVideo.ProtectPassword;
            chkFriends.Checked = objVideo.Friends;
            chkFollowers.Checked = objVideo.Followers;
            if (ddlShareType.Items.FindByValue(objVideo.ShareType.ToString()) != null)
            {
                ddlShareType.SelectedIndex = -1;
                ddlShareType.Items.FindByValue(objVideo.ShareType.ToString()).Selected = true;
                OnShareType_SelectedIndexChanged(objVideo.ShareType.ToString());
            }
            //绑定groups items,first we need empty every item
            foreach (System.Web.UI.WebControls.ListItem item in cblGroups.Items)
            {
                item.Selected = false;
            }
            if (!string.IsNullOrEmpty(objVideo.Groups))
            {
                foreach (string group in objVideo.Groups.Split(','))
                {
                    foreach (System.Web.UI.WebControls.ListItem item in cblGroups.Items)
                    {
                        if (item.Value == group)
                        {
                            item.Selected = true;
                            break;
                        }
                    }
                }
            }
         

            ctlLinkUrl.Url = objVideo.LinkUrl;
            chkFeatured.Checked = objVideo.Featured;
            chkAuthed.Checked = objVideo.Authed;
            chkActive.Checked = objVideo.Active;

            //Image

            ctlImage.Url = objVideo.Image;

            RecursiveHelper.FillAspNetTreeCheckBox(ref tvCategory, objVideo.Categories, true);

            List<VideoToTagInfo> tags = (from t in VideoToTagController.GetByVideo(serialId) select t).ToList();

            txtTag1.Text = tags.Count > 0 ? tags[0].Tag : "";
            txtTag2.Text = tags.Count > 1 ? tags[1].Tag : "";
            txtTag3.Text = tags.Count > 2 ? tags[2].Tag : "";
            txtTag4.Text = tags.Count > 3 ? tags[3].Tag : "";
            txtTag5.Text = tags.Count > 4 ? tags[4].Tag : "";
            txtTag6.Text = tags.Count > 5 ? tags[5].Tag : "";
            txtTag7.Text = tags.Count > 6 ? tags[6].Tag : "";
            txtTag8.Text = tags.Count > 7 ? tags[7].Tag : "";
            txtTag9.Text = tags.Count > 8 ? tags[8].Tag : "";
            txtTag10.Text = tags.Count > 9 ? tags[9].Tag : "";

            //Date
            if (!Null.IsNull(objVideo.PublishDate)) txtPublishDate.Text = objVideo.PublishDate.ToShortDateString();
            if (!Null.IsNull(objVideo.ExpireDate)) txtExpireDate.Text = objVideo.ExpireDate.ToShortDateString();

            cblViewRoles = Cross.DNN.Common.Utility.Utils.FillRolesCheckBox(cblViewRoles, objVideo.ViewRoles, PortalSettings.AdministratorRoleId, PortalId);

            //rating 
            chkAllowRating.Checked = objVideo.AllowRating;
            cblRatingRoles = Cross.DNN.Common.Utility.Utils.FillRolesCheckBox(cblRatingRoles, objVideo.RatingRoles, PortalSettings.AdministratorRoleId, PortalId);

            //Comment value
            chkAllowComment.Checked = objVideo.AllowComment;
            chkAutoAuthComment.Checked = objVideo.AutoAuthComment;
            cblCommentRoles = Cross.DNN.Common.Utility.Utils.FillRolesCheckBox(cblCommentRoles, objVideo.CommentRoles, PortalSettings.AdministratorRoleId, PortalId);

            //
            chkAllowRecommend.Checked = objVideo.AllowRecommend;
            cblRecommendRoles = Cross.DNN.Common.Utility.Utils.FillRolesCheckBox(cblRecommendRoles, objVideo.RecommendRoles, PortalSettings.AdministratorRoleId, PortalId);

            cblDownloadRoles = Cross.DNN.Common.Utility.Utils.FillRolesCheckBox(cblDownloadRoles, objVideo.DownloadRoles, PortalSettings.AdministratorRoleId, PortalId);



            txtSummary.Text = objVideo.Summary;
            txtDetail.Text = string.IsNullOrEmpty(objVideo.Description) ? "" : Server.HtmlDecode(objVideo.Description);

            txtField1.Text = string.IsNullOrEmpty(objVideo.Field1) ? "" : Server.HtmlDecode(objVideo.Field1);
            txtField2.Text = string.IsNullOrEmpty(objVideo.Field2) ? "" : Server.HtmlDecode(objVideo.Field2);
            txtField3.Text = string.IsNullOrEmpty(objVideo.Field3) ? "" : Server.HtmlDecode(objVideo.Field3);
            txtField4.Text = string.IsNullOrEmpty(objVideo.Field4) ? "" : Server.HtmlDecode(objVideo.Field4);
            txtField5.Text = string.IsNullOrEmpty(objVideo.Field5) ? "" : Server.HtmlDecode(objVideo.Field5);

            txtLatitude.Text = objVideo.Latitude;
            txtLongitude.Text = objVideo.Longitude;
            txtMapTitle.Text = objVideo.MapTitle;

            BindUserDefinedData(serialId);

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            switch (CurrentTarget)
            {
                case "Serial":
                    //Unregister standard version.
                    if ((CurrentEdition == Cross.DNN.Common.License.Edition.Standard) && (!Settings_Portal.General.Registered))
                    {
                        if (VideoController.GetItemCount(PortalId,-1) > LocalUtils.ItemCount_UnregisterVersionLimit)
                        {
                            DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, Localization.GetString("Tip_RegModule", LocalResourceFile), ModuleMessage.ModuleMessageType.YellowWarning);
                            return;
                        }
                    }
                    if (GetUserItemCountLimt_Video(UserId) != LocalUtils.ItemCount_Unlimited && VideoController.GetItemCount(PortalId, UserId) > GetUserItemCountLimt_Video(UserId))
                    {
                        DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, Localization.GetString("Tip_ItemExceed", LocalResourceFile), ModuleMessage.ModuleMessageType.YellowWarning);
                        return;
                    }
                    txtField1.Text = Server.HtmlDecode(CurrentType.Field1Default);
                    txtField2.Text = Server.HtmlDecode(CurrentType.Field2Default);
                    txtField3.Text = Server.HtmlDecode(CurrentType.Field3Default);
                    txtField4.Text = Server.HtmlDecode(CurrentType.Field4Default);
                    txtField5.Text = Server.HtmlDecode(CurrentType.Field5Default);
                    SerialId = -1;
                    txtSerialTitle.Text = "";

                    txtProtectPassword.Text = AuthorController.Get(UserId).ProtectPassword;
                    txtSerialTitle.Focus();
                    break;
                case "Video":
                    //Unregister standard version.
                    if ((CurrentEdition == Cross.DNN.Common.License.Edition.Standard) && (!Settings_Portal.General.Registered))
                    {
                        if (VideoController.GetItemCount(PortalId, -1) > LocalUtils.ItemCount_UnregisterVersionLimit)
                        {
                            DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, Localization.GetString("Tip_RegModule", LocalResourceFile), ModuleMessage.ModuleMessageType.YellowWarning);
                            return;
                        }
                     
                    }
                    if (GetUserItemCountLimt_Video(UserId) != LocalUtils.ItemCount_Unlimited && VideoController.GetItemCount(PortalId, UserId) > GetUserItemCountLimt_Video(UserId))
                    {
                        DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, Localization.GetString("Tip_ItemExceed", LocalResourceFile), ModuleMessage.ModuleMessageType.YellowWarning);
                        return;
                    }
                    break;
                default:
                    break;
            }
            SetLayout("Add" + CurrentTarget);
        }

        private void UpdateSerial()
        {
            VideoInfo objVideo = new VideoInfo();
            if (SerialId != -1)
            {
                objVideo = VideoController.Get(SerialId);
            }
            objVideo.Id = SerialId;
            objVideo.PortalId = PortalId;
            objVideo.TypeId = TypeId;
            //Normal 
            objVideo.Title = txtSerialTitle.Text;
           

            objVideo.Author = txtAuthor.Text;
            objVideo.Source = txtSource.Text;
            objVideo.Quote = chkQuote.Checked;

            objVideo.ShareType = Convert.ToInt16(ddlShareType.SelectedValue);
            objVideo.Private = ddlShareType.SelectedValue == "1";
            objVideo.Protected = ddlShareType.SelectedValue == "2";
            objVideo.ProtectPassword = txtProtectPassword.Text;
            objVideo.Friends = chkFriends.Checked;
            objVideo.Followers = chkFollowers.Checked;
            if (cblGroups.Items.Count > 0)
            {
                objVideo.Groups = Cross.DNN.Common.Utility.Utils.GetCheckedItems(cblGroups);
            }
            else
            {
                objVideo.Groups = string.Empty;
            }

         
            objVideo.LinkUrl = ctlLinkUrl.Url;

            if (HasManagePermission)
            {
                objVideo.DisplayOrder = Convert.ToInt32(txtDisplayOrder.Text);
                //other
                if (Settings_Portal.General.VideoRequireApproval == true)
                {
                    objVideo.Authed = chkAuthed.Checked;
                }
                else
                {
                    objVideo.Authed = true;
                }
                objVideo.Featured = chkFeatured.Checked;
            }
            else
            {
                objVideo.DisplayOrder = 100;
                objVideo.Authed = !Settings_Portal.General.VideoRequireApproval;
                objVideo.Featured = false;
            }

            objVideo.Active = chkActive.Checked;


            if (CurrentType.FieldEnable_Image)
            {
                //Image and thumbnail
                objVideo.Image = ctlImage.Url;
                objVideo.Thumbnail = "";
            }
            else
            {
                objVideo.Image = string.Empty;
                objVideo.Thumbnail = string.Empty;
            }
            //File
            if (objVideo.Image.StartsWith("FileID="))
            {
                //local file
                if (Settings_Portal.General.FileStorage == LocalUtils.FileStorage_Local)
                {
                    FileController fc = new FileController();
                    DotNetNuke.Services.FileSystem.FileInfo fi = new DotNetNuke.Services.FileSystem.FileInfo();
                    DotNetNuke.Entities.Portals.PortalController ctlPortal = new DotNetNuke.Entities.Portals.PortalController();
                    DotNetNuke.Entities.Portals.PortalInfo pi = ctlPortal.GetPortal(PortalId);
                    fi = GetFileInfoById(objVideo.Image);
                    if (fi != null && System.IO.File.Exists(fi.PhysicalPath))
                    {
                        objVideo.Thumbnail = DotNetNuke.Common.Globals.ApplicationPath + "/" + pi.HomeDirectory + "/" + fi.Folder + fi.FileName;
                        System.IO.FileInfo physicalFile = new System.IO.FileInfo(fi.PhysicalPath);

                        if (!fi.FileName.ToLower().StartsWith("thumb_"))//文件没有以"thumb_"开头，则先查找是否存在以thumb_ 开头的同名图片
                        {
                            if (System.IO.File.Exists(physicalFile.DirectoryName + "\\" + "thumb_" + physicalFile.Name))//存在该文件，则自动指向
                            {
                                objVideo.Thumbnail = DotNetNuke.Common.Globals.ApplicationPath + "/" + pi.HomeDirectory + "/" + fi.Folder + "thumb_" + fi.FileName;
                            }
                            else//不存在，则生成该文件，然后指向
                            {
                                if (Settings_Portal.General.GenerateThumb)
                                {
                                    Cross.DNN.Common.Utility.Utils.ResizeImage(fi.PhysicalPath, Settings_Portal.General.ThumbnailSize, physicalFile.DirectoryName + "\\" + "thumb_" + physicalFile.Name);
                                    objVideo.Thumbnail = DotNetNuke.Common.Globals.ApplicationPath + "/" + pi.HomeDirectory + "/" + fi.Folder + "thumb_" + fi.FileName;
                                }
                            }
                        }
                    }
                }
                //a3
                if (Settings_Portal.General.FileStorage == LocalUtils.FileStorage_A3)
                {
                    int a3FileId = Convert.ToInt32(objVideo.Image.Replace("FileID=", ""));
                    A3FileInfo objA3File = A3FileController.Get(a3FileId);
                    if (objA3File != null && A3FileController.GetByA3Key(GetA3FilePrefix(objA3File.FolderId) + "thumb_" + objA3File.FileName) != null)
                    {
                        objVideo.Thumbnail = A3FileController.GetByA3Key(GetA3FilePrefix(objA3File.FolderId) + "thumb_" + objA3File.FileName).A3Url;
                    }
                }
            }
            //External images
            if (objVideo.Image.ToLower().StartsWith("http"))
            {
                objVideo.Thumbnail = objVideo.Image;
            }
           
            //Add Categories
            objVideo.Categories = RecursiveHelper.GetAspNetTreeCheckList(tvCategory);
            objVideo.Field1 = GetHtmlEditorText(txtField1.Text);
            objVideo.Field2 = GetHtmlEditorText(txtField2.Text);
            objVideo.Field3 = GetHtmlEditorText(txtField3.Text);
            objVideo.Field4 = GetHtmlEditorText(txtField4.Text);
            objVideo.Field5 = GetHtmlEditorText(txtField5.Text);

            objVideo.Latitude = txtLatitude.Text.Trim();
            objVideo.Longitude = txtLongitude.Text.Trim();
            objVideo.MapTitle = txtMapTitle.Text.Trim();
            //Add Tags
            objVideo.Tags = "";
            TagInfo objTag = new TagInfo();
            List<int> tagList = new List<int>();
            if (txtTag1.Text.Trim() != "")
            {
                objTag = TagController.GetByTag(txtTag1.Text.Trim(), TypeId);
                if (objTag == null)
                {
                    objTag = new TagInfo();
                    objTag.TypeId = TypeId;
                    objTag.PortalId = PortalId;
                    objTag.UserId = UserId;
                    objTag.Tag = txtTag1.Text.Trim();
                    objTag.Id = TagController.Add(objTag);
                }
                tagList.Add(objTag.Id);
            }
            if (txtTag2.Text.Trim() != "" && Settings_Portal.General.TagSelectCount > 1)
            {
                objTag = TagController.GetByTag(txtTag2.Text.Trim(), TypeId);
                if (objTag == null)
                {
                    objTag = new TagInfo();
                    objTag.TypeId = TypeId;
                    objTag.PortalId = PortalId;
                    objTag.UserId = UserId;
                    objTag.Tag = txtTag2.Text.Trim();
                    objTag.Id = TagController.Add(objTag);
                }
                tagList.Add(objTag.Id);
            }
            if (txtTag3.Text.Trim() != "" && Settings_Portal.General.TagSelectCount > 2)
            {
                objTag = TagController.GetByTag(txtTag3.Text.Trim(), TypeId);
                if (objTag == null)
                {
                    objTag = new TagInfo();
                    objTag.TypeId = TypeId;
                    objTag.PortalId = PortalId;
                    objTag.UserId = UserId;
                    objTag.Tag = txtTag3.Text.Trim();
                    objTag.Id = TagController.Add(objTag);
                }
                tagList.Add(objTag.Id);
            }
            if (txtTag4.Text.Trim() != "" && Settings_Portal.General.TagSelectCount > 3)
            {
                objTag = TagController.GetByTag(txtTag4.Text.Trim(), TypeId);
                if (objTag == null)
                {
                    objTag = new TagInfo();
                    objTag.TypeId = TypeId;
                    objTag.PortalId = PortalId;
                    objTag.UserId = UserId;
                    objTag.Tag = txtTag4.Text.Trim();
                    objTag.Id = TagController.Add(objTag);
                }
                tagList.Add(objTag.Id);
            }
            if (txtTag5.Text.Trim() != "" && Settings_Portal.General.TagSelectCount > 4)
            {
                objTag = TagController.GetByTag(txtTag5.Text.Trim(), TypeId);
                if (objTag == null)
                {
                    objTag = new TagInfo();
                    objTag.TypeId = TypeId;
                    objTag.PortalId = PortalId;
                    objTag.UserId = UserId;
                    objTag.Tag = txtTag5.Text.Trim();
                    objTag.Id = TagController.Add(objTag);
                }
                tagList.Add(objTag.Id);
            }
            if (txtTag6.Text.Trim() != "" && Settings_Portal.General.TagSelectCount > 5)
            {
                objTag = TagController.GetByTag(txtTag6.Text.Trim(), TypeId);
                if (objTag == null)
                {
                    objTag = new TagInfo();
                    objTag.TypeId = TypeId;
                    objTag.PortalId = PortalId;
                    objTag.UserId = UserId;
                    objTag.Tag = txtTag6.Text.Trim();
                    objTag.Id = TagController.Add(objTag);
                }
                tagList.Add(objTag.Id);
            }
            if (txtTag7.Text.Trim() != "" && Settings_Portal.General.TagSelectCount > 6)
            {
                objTag = TagController.GetByTag(txtTag7.Text.Trim(), TypeId);
                if (objTag == null)
                {
                    objTag = new TagInfo();
                    objTag.TypeId = TypeId;
                    objTag.PortalId = PortalId;
                    objTag.UserId = UserId;
                    objTag.Tag = txtTag7.Text.Trim();
                    objTag.Id = TagController.Add(objTag);
                }
                tagList.Add(objTag.Id);
            }
            if (txtTag8.Text.Trim() != "" && Settings_Portal.General.TagSelectCount > 7)
            {
                objTag = TagController.GetByTag(txtTag8.Text.Trim(), TypeId);
                if (objTag == null)
                {
                    objTag = new TagInfo();
                    objTag.TypeId = TypeId;
                    objTag.PortalId = PortalId;
                    objTag.UserId = UserId;
                    objTag.Tag = txtTag8.Text.Trim();
                    objTag.Id = TagController.Add(objTag);
                }
                tagList.Add(objTag.Id);
            }
            if (txtTag9.Text.Trim() != "" && Settings_Portal.General.TagSelectCount > 8)
            {
                objTag = TagController.GetByTag(txtTag9.Text.Trim(), TypeId);
                if (objTag == null)
                {
                    objTag = new TagInfo();
                    objTag.TypeId = TypeId;
                    objTag.PortalId = PortalId;
                    objTag.UserId = UserId;
                    objTag.Tag = txtTag9.Text.Trim();
                    objTag.Id = TagController.Add(objTag);
                }
                tagList.Add(objTag.Id);
            }
            if (txtTag10.Text.Trim() != "" && Settings_Portal.General.TagSelectCount > 9)
            {
                objTag = TagController.GetByTag(txtTag10.Text.Trim(), TypeId);
                if (objTag == null)
                {
                    objTag = new TagInfo();
                    objTag.TypeId = TypeId;
                    objTag.PortalId = PortalId;
                    objTag.UserId = UserId;
                    objTag.Tag = txtTag10.Text.Trim();
                    objTag.Id = TagController.Add(objTag);
                }
                tagList.Add(objTag.Id);
            }
            var newTaglist = (from p in tagList select p).Distinct();//remove the  repeated tag item.

            foreach (int item in newTaglist)
            {
                objVideo.Tags += item.ToString() + ",";
            }
            objVideo.Tags = Cross.DNN.Common.Utility.Utils.RemoveSeperator(objVideo.Tags, ",");
            //Tags end

            //date
            if ((txtPublishDate.Text != null) && (txtPublishDate.Text != ""))
            {
                objVideo.PublishDate = Convert.ToDateTime(txtPublishDate.Text);
            }
            else
            {
                objVideo.PublishDate = DateTime.Now;
            }
            if (txtExpireDate.Text != "")
            {
                objVideo.ExpireDate = Convert.ToDateTime(txtExpireDate.Text);
            }
            if (HasManagePermission)
            {
                objVideo.ViewRoles = Cross.DNN.Common.Utility.Utils.GetCheckedItems(cblViewRoles, PortalSettings.AdministratorRoleId);
                //Rating
                objVideo.AllowRating = chkAllowRating.Checked;
                objVideo.RatingRoles = Cross.DNN.Common.Utility.Utils.GetCheckedItems(cblRatingRoles, PortalSettings.AdministratorRoleId);

                //Recommend
                objVideo.AllowRecommend = chkAllowRecommend.Checked;
                objVideo.RecommendRoles = Cross.DNN.Common.Utility.Utils.GetCheckedItems(cblRecommendRoles, PortalSettings.AdministratorRoleId);


                //Comment
                objVideo.AllowComment = chkAllowComment.Checked;
                objVideo.CommentRoles = Cross.DNN.Common.Utility.Utils.GetCheckedItems(cblCommentRoles, PortalSettings.AdministratorRoleId);
                objVideo.AutoAuthComment = chkAutoAuthComment.Checked;
                //Download roles
                objVideo.DownloadRoles = Cross.DNN.Common.Utility.Utils.GetCheckedItems(cblDownloadRoles, PortalSettings.AdministratorRoleId);
            }
            else
            {
                objVideo.ViewRoles = Settings_Portal.General.VideoViewRoles;
                objVideo.AllowRating = Settings_Portal.Rating.AllowRating;
                objVideo.RatingRoles = Settings_Portal.Rating.RatingRoles;

                objVideo.AllowRecommend = Settings_Portal.Recommend.AllowRecommend;
                objVideo.RecommendRoles = Settings_Portal.Recommend.RecommendRoles;

                objVideo.AllowComment = Settings_Portal.Comment.AllowComment;
                objVideo.CommentRoles = Settings_Portal.Comment.CommentRoles;
                objVideo.AutoAuthComment = Settings_Portal.Comment.AutoAuthComment;

                objVideo.DownloadRoles = Settings_Portal.Download.DownloadRoles;
            }


            objVideo.Summary = Cross.DNN.Common.Utility.Utils.RemoveAllHtmlTags(txtSummary.Text);
            objVideo.Description = GetHtmlEditorText(txtDetail.Text);
            objVideo.UserId = UserId;
            objVideo.UserName = UserInfo.DisplayName;
            objVideo.MediaType = CurrentType.MediaType;
            objVideo.VideoType = Convert.ToInt32(VideoType.SerialMaster);//Single video

            //Now processing attachment
            int newVideoId = -1;
            if (SerialId == -1)
            {
                objVideo.HasVideo = false;
                newVideoId = VideoController.Add(objVideo);
             
            }
            else
            {
                objVideo.HasVideo = VideoController.GetBySerial(SerialId).Count > 0;
                VideoController.Update(objVideo,true);
                newVideoId = SerialId;

            }
            UpdateUserDefinedData(newVideoId);
            //Reset all 
            SerialId = -1;
        }

        private void UpdateVideo()
        {
            VideoInfo objVideo = new VideoInfo();
            if (VideoId != -1)
            {
                objVideo = VideoController.Get(VideoId);
            }
            objVideo.Id = VideoId;
            objVideo.PortalId = PortalId;
            objVideo.TypeId = TypeId;
            //Normal 
            objVideo.Title = txtVideoTitle.Text;
            objVideo.VideoFile = ctlVideoFile.Url;
            objVideo.VideoPath = ctlVideoFile.FullUrl;
            objVideo.UrlMode = ctlVideoFile.UrlMode;
            objVideo.Duration = txtVideoDuration.Text.Trim();
            if (ctlVideoFile.Url.StartsWith("FileID="))// 当前选择为文件，因此试图获取其duration
            {
                int fileId = Convert.ToInt32(ctlVideoFile.Url.Replace("FileID=", ""));
                if (txtVideoDuration.Text.Trim() == "")
                {
                    objVideo.Duration = GetVideoDuration(fileId);
                }
            }
            //if (CurrentType.MediaType == Convert.ToInt32(MediaType.Video))
            //{
                objVideo.HttpType = ddlHttpType.SelectedValue;
            //}
            //else
            //{
            //    objVideo.HttpType = "Audio";
            //}

  
            if (CurrentType.FieldEnable_Image)
            {
                //Image and thumbnail
                objVideo.Image = ctlVideoImage.Url;
                objVideo.Thumbnail = "";
            }
            else
            {
                objVideo.Image = string.Empty;
                objVideo.Thumbnail = string.Empty;
            }
            //File
            if (objVideo.Image.StartsWith("FileID="))
            {
                //local file
                if (Settings_Portal.General.FileStorage == LocalUtils.FileStorage_Local)
                {
                    FileController fc = new FileController();
                    DotNetNuke.Services.FileSystem.FileInfo fi = new DotNetNuke.Services.FileSystem.FileInfo();
                    DotNetNuke.Entities.Portals.PortalController ctlPortal = new DotNetNuke.Entities.Portals.PortalController();
                    DotNetNuke.Entities.Portals.PortalInfo pi = ctlPortal.GetPortal(PortalId);
                    fi = GetFileInfoById(objVideo.Image);
                    if (fi != null && System.IO.File.Exists(fi.PhysicalPath))
                    {
                        objVideo.Thumbnail = DotNetNuke.Common.Globals.ApplicationPath + "/" + pi.HomeDirectory + "/" + fi.Folder + fi.FileName;
                        System.IO.FileInfo physicalFile = new System.IO.FileInfo(fi.PhysicalPath);

                        if (!fi.FileName.ToLower().StartsWith("thumb_"))//文件没有以"thumb_"开头，则先查找是否存在以thumb_ 开头的同名图片
                        {
                            if (System.IO.File.Exists(physicalFile.DirectoryName + "\\" + "thumb_" + physicalFile.Name))//存在该文件，则自动指向
                            {
                                objVideo.Thumbnail = DotNetNuke.Common.Globals.ApplicationPath + "/" + pi.HomeDirectory + "/" + fi.Folder + "thumb_" + fi.FileName;
                            }
                            else//不存在，则生成该文件，然后指向
                            {
                                if (Settings_Portal.General.GenerateThumb)
                                {
                                    Cross.DNN.Common.Utility.Utils.ResizeImage(fi.PhysicalPath, Settings_Portal.General.ThumbnailSize, physicalFile.DirectoryName + "\\" + "thumb_" + physicalFile.Name);
                                    objVideo.Thumbnail = DotNetNuke.Common.Globals.ApplicationPath + "/" + pi.HomeDirectory + "/" + fi.Folder + "thumb_" + fi.FileName;
                                }
                            }
                        }
                    }
                }
                //a3
                if (Settings_Portal.General.FileStorage == LocalUtils.FileStorage_A3)
                {
                    int a3FileId = Convert.ToInt32(objVideo.Image.Replace("FileID=", ""));
                    A3FileInfo objA3File = A3FileController.Get(a3FileId);
                    if (objA3File != null && A3FileController.GetByA3Key(GetA3FilePrefix(objA3File.FolderId) + "thumb_" + objA3File.FileName) != null)
                    {
                        objVideo.Thumbnail = A3FileController.GetByA3Key(GetA3FilePrefix(objA3File.FolderId) + "thumb_" + objA3File.FileName).A3Url;
                    }
                }
            }
            //External images
            if (objVideo.Image.ToLower().StartsWith("http"))
            {
                objVideo.Thumbnail = objVideo.Image;
            }
            if (string.IsNullOrEmpty(objVideo.Image))//没有设置任何图片，因此试图自动获取
            {
                if (ctlVideoFile.Url.StartsWith("FileID="))// 当前选择为文件，因此试图获取其duration,thunmnail
                {
                    int fileId = Convert.ToInt32(ctlVideoFile.Url.Replace("FileID=", ""));
                    objVideo.Image = GetVideoThumbnail(fileId);
                    objVideo.Thumbnail = objVideo.Image;
                }
                //自动获取youtube video 的image
                if (ctlVideoFile.Url.ToLower().IndexOf("youtu") > 0)
                {
                    if (!string.IsNullOrEmpty(LocalUtils.GetYouTubeVideoId(ctlVideoFile.Url)))
                    {
                        objVideo.Image = LocalUtils.GetYouTubeVideoImage_FullSize(ctlVideoFile.Url, System.Web.HttpContext.Current.Request.IsSecureConnection);
                        objVideo.Thumbnail = LocalUtils.GetYouTubeVideoImage_Thumbnail(ctlVideoFile.Url, System.Web.HttpContext.Current.Request.IsSecureConnection);
                    }
                }
            }       
            objVideo.UserId = UserId;
            objVideo.UserName = UserInfo.DisplayName;
            objVideo.MediaType = CurrentType.MediaType;
            objVideo.VideoType = Convert.ToInt32(VideoType.SerialSlave);//Single video
            objVideo.SerialOrder = Convert.ToInt32(txtSerialOrder.Text);
            objVideo.MasterVideoId = SerialId;
            //Now processing attachment
            int newVideoId = -1;
            if (VideoId == -1)
            {
                newVideoId = VideoController.Add(objVideo);
                VideoInfo objSerial = VideoController.Get(SerialId);
                if (objSerial.HasVideo==false)//如果是第一次增加，则需要修改其 master video 的has video 属性
                {
                    objSerial.HasVideo = true;
                    VideoController.Update(objSerial,false);
                }
            }
            else
            {
                VideoController.Update(objVideo,false);
                newVideoId = VideoId;

            }
            //Reset all 
            VideoId = -1;
           
        }

        private void BindSerialList()
        {
            int totalRecords = 0;
            int pageSize = Convert.ToInt32(ddlPageSize.SelectedValue);
            DotNetNuke.Security.PortalSecurity ps = new DotNetNuke.Security.PortalSecurity();
            string search = ps.InputFilter(txtSearch.Text.Trim(), DotNetNuke.Security.PortalSecurity.FilterFlag.NoSQL);

            List<VideoInfo> list = VideoController.GetByType(TypeId, Convert.ToInt32(ddlCategory.SelectedValue), UserId, Convert.ToInt32(VideoType.SerialMaster),
                ddlVideoStatus.SelectedValue == "UnAuthed", ddlVideoStatus.SelectedValue == "Featured",
                ddlVideoStatus.SelectedValue == "UnActive", ddlVideoStatus.SelectedValue == "Expired",
                ddlVideoStatus.SelectedValue == "Private", ddlVideoStatus.SelectedValue == "Protected",
                search, pageSize, CurrentPage, ref totalRecords);

            gvList.DataSource = list;
            gvList.DataBind();

            ctlPagingControl.RecordCount = totalRecords;
            ctlPagingControl.PageSize = pageSize;
            ctlPagingControl.CurrentPage = CurrentPage;
            ctlPagingControl.Span = 5;
            divLegend.Visible = list.Count > 0;
        }

        private void BindVideoList()
        {
            gvVideoList.DataSource = VideoController.GetBySerial(SerialId);
            gvVideoList.DataBind();
        }




        protected void btnCancel_Click(object sender, EventArgs e)
        {
            switch (CurrentTarget)
            {
                case "Serial":
                    SerialId = -1;
                    hidLastTab.Value = "#divBasic";
                    SetLayout("ViewSerialList");
                    break;
                case "Video":
                    SetLayout("ViewVideoList");
                    break;
                case "Image":
                    SetLayout("ViewImageList");
                    break;
                default:
                    break;
            }

        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            switch (CurrentTarget)
            {
                case "Serial":

                    VideoController.Delete(SerialId);
                  
                    SerialId = -1;
                    BindSerialList();
                    SetLayout("ViewSerialList");
                    break;
                case "Video":

                    VideoController.Delete(VideoId);
                    VideoId = -1;

                    BindVideoList();
                    //check if serial has no video in it.
                    if (VideoController.GetBySerial(SerialId).Count<1)
                    {
                        VideoInfo objSerial = VideoController.Get(SerialId);
                        objSerial.HasVideo = false;
                        VideoController.Update(objSerial,false);
                    }
                    SetLayout("ViewVideoList");
                    break;

                case "Image":
                    ImageController.Delete(ImageId);
                    ImageId = -1;
                    BindImageList();
                    SetLayout("ViewImageList");
                    break;
                default:
                    break;
            }
            DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, Localization.GetString("Tip_DeleteSuccess", LocalResourceFile),
                DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess);
        }

        private void BindImageList()
        {
            gvImageList.DataSource = ImageController.GetByVideo(SerialId);
            gvImageList.DataBind();
        }

        private void SetLayout(string command)
        {
            tblButton.Visible = true;
            btnBackToList.Visible = false;
            btnDeleteSelected.Visible = false;

            tblSerialList.Visible = false;
            divSerialDetail.Visible = false;




            tblImageList.Visible = false;
            tblImageDetail.Visible = false;

            tblVideoList.Visible = false;
            tblVideoDetail.Visible = false;

            tblAttachment.Visible = false;
            VideoInfo objVideo = new VideoInfo();
            if (SerialId != -1)
            {
                objVideo = VideoController.Get(SerialId);
            }
            lblVideoQuota.Visible = false;
            switch (command)
            {
                case "ViewSerialList":
                    lblVideoQuota.Visible = true;
                    lblType.Visible = true;
                    ddlType.Visible = true;
                    btnAdd.Visible = true;
                    btnAdd.Text = Localization.GetString("btnAddSerial", LocalResourceFile);

                    btnDeleteSelected.Visible = true;

                    btnDelete.Visible = false;
                    btnDelete1.Visible = false;

                    btnUpdate.Visible = false;
                    btnUpdate1.Visible = false;

                    btnCancel.Visible = false;
                    btnCancel1.Visible = false;

                    tblSerialList.Visible = true;
                    CurrentTarget = "Serial";
                    break;

                case "AddSerial":

                    lblType.Visible = false;
                    ddlType.Visible = false;
                    btnAdd.Visible = false;
                    txtSerialTitle.Text = "";

                    btnDelete.Visible = false;
                    btnDelete1.Visible = false;

                    btnUpdate.Visible = true;
                    btnUpdate1.Visible = true;
                    btnCancel.Visible = true;
                    btnCancel1.Visible = true;

                    divSerialDetail.Visible = true;
                    CurrentTarget = "Serial";
                    break;
                case "SelectSerial":
                    lblType.Visible = false;
                    ddlType.Visible = false;
                    btnAdd.Visible = false;

                    btnDelete.Visible = true;
                    btnDelete1.Visible = true;

                    btnUpdate.Visible = true;
                    btnUpdate1.Visible = true;
                    btnCancel.Visible = true;
                    btnCancel1.Visible = true;

                    divSerialDetail.Visible = true;
                    CurrentTarget = "Serial";
                    break;

                case "ViewAttachmentList":
                    lblType.Visible = false;
                    ddlType.Visible = false;
                    btnAdd.Visible = false;

                    btnDelete.Visible = false;
                    btnDeleteSelected.Visible = true;

                    btnUpdate.Visible = false;

                    btnCancel.Visible = false;


                    tblAttachment.Visible = true;
                    lblAttachmentList.Text = string.Format(Localization.GetString("lblAttachmentList", LocalResourceFile), objVideo.Title);
                    CurrentTarget = "Attachment";
                    break;

                case "ViewImageList":
                    lblType.Visible = false;
                    ddlType.Visible = false;
                    btnAdd.Visible = true;
                    btnAdd.Text = Localization.GetString("btnAddImage", LocalResourceFile);
                    btnDelete.Visible = false;
                    btnDeleteSelected.Visible = true;

                    btnUpdate.Visible = false;

                    btnCancel.Visible = false;


                    tblImageList.Visible = true;
                    lblImageList.Text = string.Format(Localization.GetString("lblImageList", LocalResourceFile), objVideo.Title);
                    CurrentTarget = "Image";
                    break;

                case "AddImage":

                    lblType.Visible = false;
                    ddlType.Visible = false;
                    btnAdd.Visible = false;
                    txtImageTitle.Text = "";
                    btnDelete.Visible = false;


                    btnUpdate.Visible = true;

                    btnCancel.Visible = true;


                    tblImageDetail.Visible = true;
                    CurrentTarget = "Image";
                    break;
                case "SelectImage":

                    lblType.Visible = false;
                    ddlType.Visible = false;
                    btnAdd.Visible = false;

                    btnDelete.Visible = true;


                    btnUpdate.Visible = true;

                    btnCancel.Visible = true;


                    tblImageDetail.Visible = true;
                    CurrentTarget = "Image";
                    break;

                case "ViewVideoList":
                    lblType.Visible = false;
                    ddlType.Visible = false;
                    btnAdd.Visible = true;
                    btnAdd.Text = Localization.GetString("btnAddVideo", LocalResourceFile);
                    btnDelete.Visible = false;
                    btnDeleteSelected.Visible = true;

                    btnUpdate.Visible = false;

                    btnCancel.Visible = false;


                    tblVideoList.Visible = true;
                    lblVideoList.Text = string.Format(Localization.GetString("lblVideoList", LocalResourceFile), objVideo.Title);
                    CurrentTarget = "Video";
                    break;

                case "AddVideo":

                    lblType.Visible = false;
                    ddlType.Visible = false;
                    btnAdd.Visible = false;
                    txtVideoTitle.Text = "";
                    btnDelete.Visible = false;


                    btnUpdate.Visible = true;

                    btnCancel.Visible = true;


                    tblVideoDetail.Visible = true;
                    CurrentTarget = "Video";
                    break;
                case "SelectVideo":

                    lblType.Visible = false;
                    ddlType.Visible = false;
                    btnAdd.Visible = false;

                    btnDelete.Visible = true;


                    btnUpdate.Visible = true;

                    btnCancel.Visible = true;


                    tblVideoDetail.Visible = true;
                    CurrentTarget = "Video";
                    break;


            }
            if (CurrentTarget != "Serial")
            {
                btnBackToList.Visible = true;
            }
        }


        private string GetFileFullUrl(int fileId)
        {
            string url = "";

            if (Settings_Portal.General.FileStorage.ToLower() == "local")
            {
                FileController ctlFile = new FileController();
                DotNetNuke.Services.FileSystem.FileInfo objFile = new DotNetNuke.Services.FileSystem.FileInfo();
                DotNetNuke.Entities.Portals.PortalController ctlPortal = new DotNetNuke.Entities.Portals.PortalController();
                DotNetNuke.Entities.Portals.PortalInfo pi = ctlPortal.GetPortal(PortalSettings.PortalId);

                objFile = ctlFile.GetFileById(fileId, PortalSettings.PortalId);
                if (objFile != null)
                {
                    url = DotNetNuke.Common.Globals.ApplicationPath + "/" + pi.HomeDirectory + "/" + objFile.Folder + objFile.FileName;
                }

            }
            if (Settings_Portal.General.FileStorage.ToLower() == "a3")
            {
                if (A3FileController.Get(fileId) != null)
                {
                    url = A3FileController.Get(fileId).A3Url;
                }
            }
            return url;
        }


        protected void btnAddImageFolder_Click(object sender, EventArgs e)
        {
            foreach (FileItem item in ctlImageFolder.FileListInCurrentFolder)
            {
                int fileId = Convert.ToInt32(item.Value);
                ImageInfo objItem = new ImageInfo();
                objItem.ImagePath = GetFileFullUrl(fileId);
                objItem.ImageFile = "FileID=" + item.Value;
                objItem.Thumbnail = objItem.ImagePath;
                string thumbnail = GetImageThumbnail(fileId);
                if (thumbnail != "")
                {
                    objItem.Thumbnail = thumbnail;
                }
                objItem.VideoId = SerialId;
                objItem.Title = item.Text;
                objItem.Description = "";
                objItem.Views = 1;

                ImageController.Add(objItem);
            }
            BindImageList();
        }

        protected void btnAddVideoFolder_Click(object sender, EventArgs e)
        {
            foreach (FileItem item in ctlVideoFolder.FileListInCurrentFolder)
            {
                int fileId = Convert.ToInt32(item.Value);
                VideoInfo objItem = new VideoInfo();
                objItem.PortalId = PortalId;
                objItem.UserId = UserId;
                objItem.TypeId = TypeId;
                objItem.MediaType = CurrentType.MediaType;
                objItem.SerialOrder = 10;
                objItem.UserName = UserInfo.DisplayName;
                objItem.VideoType = Convert.ToInt32(VideoType.SerialSlave);
                objItem.HttpType = CurrentType.MediaType == Convert.ToInt32(MediaType.Video) ? "Video" : "Audio";
                objItem.UrlMode = LocalUtils.UrlMode_File;
                objItem.Duration = GetVideoDuration(fileId);
                objItem.Thumbnail = GetVideoThumbnail(fileId);
                objItem.MasterVideoId = SerialId;
                objItem.Title = item.Text;
                objItem.Description = "";
                objItem.Views = 1;
                objItem.VideoPath = GetFileFullUrl(fileId);
                objItem.VideoFile = "FileID=" + item.Value;
                VideoController.Add(objItem);
            }
            if (ctlVideoFolder.FileListInCurrentFolder.Count>0)//增加了video
            {
                VideoInfo objSerial = VideoController.Get(SerialId);
                if (objSerial.HasVideo==false)//修改has video属性
                {
                    objSerial.HasVideo = true;
                    VideoController.Update(objSerial, false);
                }
            }
            BindVideoList();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            switch (CurrentTarget)
            {
                case "Serial":
                    if (!IsSerialDataValid())
                    {
                        return;
                    }
                    UpdateSerial();
                    SerialId = -1;
                    BindSerialList();
                    SetLayout("ViewSerialList");
                    break;

                case "Video":
                    if (!IsVideoDataValid())
                    {
                        return;
                    }
                    UpdateVideo();
                    VideoId = -1;
                    BindVideoList();
                    SetLayout("ViewVideoList");
                    break;

                case "Image":
                    if (!IsImageDataValid())
                    {
                        return;
                    }
                    UpdateImage();
                    BindImageList();
                    SetLayout("ViewImageList");
                    break;
                default:
                    break;
            }
            DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, Localization.GetString("Tip_UpdateSuccess", LocalResourceFile), 
                DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess);
        }

        private string GetVideoDuration(int fileId)
        {
            string duration = "";
            if (Settings_Portal.General.FileStorage == LocalUtils.FileStorage_Local)
            {
                FileController ctlFile = new FileController();
                DotNetNuke.Services.FileSystem.FileInfo objFile = new DotNetNuke.Services.FileSystem.FileInfo();
                DotNetNuke.Entities.Portals.PortalController ctlPortal = new DotNetNuke.Entities.Portals.PortalController();
                DotNetNuke.Entities.Portals.PortalInfo pi = ctlPortal.GetPortal(PortalId);
                objFile = ctlFile.GetFileById(fileId, PortalId);

                if (objFile != null && System.IO.File.Exists(objFile.PhysicalPath))
                {
                    System.IO.FileInfo objPhysical = new System.IO.FileInfo(objFile.PhysicalPath);
                    if (Settings_Portal.Video.VideoConvert && Settings_Portal.Video.PassPermissionCheck)
                    {
                        Cross.DNN.Common.VideoManage.VideoManageOption option = new Cross.DNN.Common.VideoManage.VideoManageOption();
                        option.General.FFMPEGPath = VideoConvert_ExecuteFolder + "\\ffmpeg\\ffmpeg.exe";
                        option.General.FLVToolPath = VideoConvert_ExecuteFolder + "\\ffmpeg\\flvtool2.exe";
                        option.General.MencoderPath = VideoConvert_ExecuteFolder + "\\mencoder\\mencoder.exe";
                        option.General.MencoderDirectory = VideoConvert_ExecuteFolder + "\\mencoder";
                        option.General.InputPath = objPhysical.Directory.FullName;
                        option.General.OutputPath = objPhysical.Directory.FullName;
                        option.Video.ExitProcess = Settings_Portal.Video.ProcessExitTime;
                        option.General.FileName = objPhysical.Name;
                        Cross.DNN.Common.VideoManage.VideoController ctlVideo = new Cross.DNN.Common.VideoManage.VideoController(option);
                        duration = ctlVideo.Get_Info().Duration;

                    }
                }
            }
            if (Settings_Portal.General.FileStorage == LocalUtils.FileStorage_A3)
            {
                A3FileInfo objA3File = A3FileController.Get(fileId);
                if (objA3File != null)
                {
                    duration = objA3File.Duration;
                }
            }
            return duration.Trim();
        }
        private string GetVideoThumbnail(int fileId)
        {
            string thumbnail = "";
            if (Settings_Portal.General.FileStorage == LocalUtils.FileStorage_Local)
            {
                FileController ctlFile = new FileController();
                DotNetNuke.Services.FileSystem.FileInfo objFile = new DotNetNuke.Services.FileSystem.FileInfo();
                DotNetNuke.Entities.Portals.PortalController ctlPortal = new DotNetNuke.Entities.Portals.PortalController();
                DotNetNuke.Entities.Portals.PortalInfo pi = ctlPortal.GetPortal(PortalId);
                objFile = ctlFile.GetFileById(fileId, PortalId);

                if (objFile != null && File.Exists(objFile.PhysicalPath))
                {
                    System.IO.FileInfo objPhysical = new System.IO.FileInfo(objFile.PhysicalPath);

                    if (File.Exists(objPhysical.DirectoryName + "\\" + "thumb_" + objPhysical.Name.Replace(objPhysical.Extension, ".jpg")))//Find if exist thumbnail image
                    {
                        thumbnail = DotNetNuke.Common.Globals.ApplicationPath + "/" + pi.HomeDirectory + "/" + objFile.Folder + "thumb_" + objFile.FileName.Replace(objPhysical.Extension, ".jpg");
                        return thumbnail;
                    }

                    if (File.Exists(objPhysical.DirectoryName + "\\" + objPhysical.Name.Replace(objPhysical.Extension, ".jpg")))//Find if exist same name image
                    {
                        thumbnail = DotNetNuke.Common.Globals.ApplicationPath + "/" + pi.HomeDirectory + "/" + objFile.Folder + objFile.FileName.Replace(objPhysical.Extension, ".jpg");
                        return thumbnail;
                    }
                    if (Settings_Portal.Video.VideoConvert && Settings_Portal.Video.PassPermissionCheck)// 如果同名的jpg文件不存在，则试图生成一个
                    {
                        Cross.DNN.Common.VideoManage.VideoManageOption option = new Cross.DNN.Common.VideoManage.VideoManageOption();
                        option.General.FFMPEGPath = VideoConvert_ExecuteFolder + "\\ffmpeg\\ffmpeg.exe";
                        option.General.FLVToolPath = VideoConvert_ExecuteFolder + "\\ffmpeg\\flvtool2.exe";
                        option.General.MencoderPath = VideoConvert_ExecuteFolder + "\\mencoder\\mencoder.exe";
                        option.General.MencoderDirectory = VideoConvert_ExecuteFolder + "\\mencoder";
                        option.General.InputPath = objPhysical.Directory.FullName;
                        option.General.OutputPath = objPhysical.Directory.FullName;
                        option.Video.ExitProcess = Settings_Portal.Video.ProcessExitTime;
                        option.General.FileName = objPhysical.Name;
                        Cross.DNN.Common.VideoManage.VideoController ctlVideo = new Cross.DNN.Common.VideoManage.VideoController(option);
                        if (File.Exists(option.General.FFMPEGPath))//First we need check if execute package available
                        {
                            ctlVideo.CaptureSingleImage();
                            thumbnail = DotNetNuke.Common.Globals.ApplicationPath + "/" + pi.HomeDirectory + "/" + objFile.Folder + objFile.FileName.Replace(objPhysical.Extension, ".jpg");
                            return thumbnail;
                        }
                    }
                }
            }
            if (Settings_Portal.General.FileStorage == LocalUtils.FileStorage_A3)
            {
                A3FileInfo objA3File = A3FileController.Get(fileId);
                if (objA3File != null)
                {
                    if (A3FileController.GetByA3Key(GetA3FilePrefix(objA3File.FolderId) + "thumb_" + objA3File.FileName.Replace(objA3File.Extension, ".jpg")) != null)
                    {
                        thumbnail = A3FileController.GetByA3Key(GetA3FilePrefix(objA3File.FolderId) + "thumb_" + objA3File.FileName.Replace(objA3File.Extension, ".jpg")).A3Url;
                    }
                    else
                    {
                        if (A3FileController.GetByA3Key(GetA3FilePrefix(objA3File.FolderId) + objA3File.FileName.Replace(objA3File.Extension, ".jpg")) != null)
                        {
                            thumbnail = A3FileController.GetByA3Key(GetA3FilePrefix(objA3File.FolderId) + objA3File.FileName.Replace(objA3File.Extension, ".jpg")).A3Url;
                        }
                    }
                }
            }
            return thumbnail;
        }

     


        private string GetImageThumbnail(int fileId)
        {
            string thumbnail = "";
            if (Settings_Portal.General.FileStorage == LocalUtils.FileStorage_Local)
            {
                FileController ctlFile = new FileController();
                DotNetNuke.Services.FileSystem.FileInfo objFile = new DotNetNuke.Services.FileSystem.FileInfo();
                DotNetNuke.Entities.Portals.PortalController ctlPortal = new DotNetNuke.Entities.Portals.PortalController();
                DotNetNuke.Entities.Portals.PortalInfo pi = ctlPortal.GetPortal(PortalId);
                objFile = ctlFile.GetFileById(fileId, PortalId);

                if (objFile != null && File.Exists(objFile.PhysicalPath))
                {
                    System.IO.FileInfo objPhysical = new System.IO.FileInfo(objFile.PhysicalPath);

                    if (File.Exists(objPhysical.DirectoryName + "\\" + "thumb_" + objPhysical.Name))//Find if exist thumbnail image
                    {
                        thumbnail = DotNetNuke.Common.Globals.ApplicationPath + "/" + pi.HomeDirectory + "/" + objFile.Folder + "thumb_" + objFile.FileName;
                    }
                }
            }
            if (Settings_Portal.General.FileStorage == LocalUtils.FileStorage_A3)
            {
                A3FileInfo objA3File = A3FileController.Get(fileId);
                if (objA3File != null)
                {
                    if (A3FileController.GetByA3Key(GetA3FilePrefix(objA3File.FolderId) + "thumb_" + objA3File.FileName) != null)
                    {
                        thumbnail = A3FileController.GetByA3Key(GetA3FilePrefix(objA3File.FolderId) + "thumb_" + objA3File.FileName).A3Url;
                    }
                }
            }
            return thumbnail;
        }
        private void UpdateImage()
        {
            ImageInfo objItem = new ImageInfo();
            if (ImageId != -1)
            {
                objItem = ImageController.Get(ImageId);
            }
            objItem.Id = ImageId;
            objItem.Thumbnail = ctlImageFile.FullUrl;
            if (ctlImageFile.Url.StartsWith("FileID="))// 当前选择为文件，因此试图获取thunmnail
            {
                string thumbnail = GetImageThumbnail(Convert.ToInt32(ctlImageFile.Url.Replace("FileID=", "")));
                if (thumbnail != "")
                {
                    objItem.Thumbnail = thumbnail;
                }
            }

            objItem.VideoId = SerialId;
            objItem.Title = txtImageTitle.Text.Trim();
            objItem.Description = txtImageFileDescription.Text;
            objItem.ImageFile = ctlImageFile.Url;
            objItem.ImagePath = ctlImageFile.FullUrl;
            objItem.Views = 1;
            if (ImageId == -1)
            {
                ImageController.Add(objItem);
            }
            else
            {
                ImageController.Update(objItem);
            }
        }

        private Boolean IsSerialDataValid()
        {
            if (Page.IsValid == false)
            {
                return false;
            }
            hidLastTab.Value = "#divBasic";
           
            string warningMessage = string.Empty;
            string udtError = string.Empty;
            if (TypeUdtList.Count > 0)
            {
                foreach (EditControl item in ListEditControls.Values)
                {
                    if (!item.IsValid())
                    {
                        udtError = item.ValidationMessage;
                        if (udtError.EndsWith(".ErrorMessage"))
                        {
                            udtError = Localization.GetString(udtError, LocalUtils.ResourcesFile_Udt);
                        }
                        warningMessage += String.Format("<li><b>{0}</b><br />{1}</li>", item.FieldTitle, udtError);
                    }
                }
                if (warningMessage != string.Empty)
                {
                    DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, warningMessage, DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.RedError);
                    return false;
                }
            }
            string category = RecursiveHelper.GetAspNetTreeCheckList(tvCategory);

            if (category == "" || category == null || category.Split(',').Length > Settings_Portal.General.CategorySelectCount)
            {
                hidLastTab.Value = "#divCategory";
                warningMessage = string.Format(Localization.GetString("Category.ErrorMessage", LocalResourceFile), Settings_Portal.General.CategorySelectCount.ToString());
                DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, warningMessage, DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.YellowWarning);
                return false;
            }
            return true;
        }

        private Boolean IsVideoDataValid()
        {
            if (Page.IsValid == false)
            {
                return false;
            }
            hidLastTab.Value = "#divBasic";
            if (ctlVideoFile.Url.Trim() == "")
            {
                DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, Localization.GetString("SpecifyVideo", LocalResourceFile), DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.YellowWarning);
                return false;
            }
          
            return true;
        }



        private Boolean IsImageDataValid()
        {
            if (Page.IsValid == false)
            {
                return false;
            }
            if (ctlImageFile.Url.Trim() == "")
            {
                DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, Localization.GetString("SpecifyImage", LocalResourceFile), DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.YellowWarning);
                return false;
            }
            return true;
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            CurrentPage = 0;
            BindSerialList();
        }

        protected void btnDeleteSelected_Click(object sender, EventArgs e)
        {
            switch (CurrentTarget)
            {

                case "Serial":
                    foreach (GridViewRow item in gvList.Rows)
                    {
                        CheckBox chkItem = (CheckBox)item.FindControl("chkItem_Serial");
                        if (chkItem.Checked == true)
                        {
                            Label lblId = (Label)item.FindControl("lblId");

                            VideoController.Delete(Convert.ToInt32(lblId.Text));
                           
                        }
                    }
                    BindSerialList();
                    break;

                case "Video":
                    foreach (GridViewRow item in gvVideoList.Rows)
                    {
                        CheckBox chkItem = (CheckBox)item.FindControl("chkItem_Video");
                        if (chkItem.Checked == true)
                        {
                            Label lblId = (Label)item.FindControl("lblId");

                            VideoController.Delete(Convert.ToInt32(lblId.Text));
                        }
                    }
                    BindVideoList();
                    //check if serial has no video in it.
                    if (VideoController.GetBySerial(SerialId).Count < 1)
                    {
                        VideoInfo objSerial = VideoController.Get(SerialId);
                        objSerial.HasVideo = false;
                        VideoController.Update(objSerial,false);
                    }
                    break;




                case "Image":
                    foreach (GridViewRow item in gvImageList.Rows)
                    {
                        CheckBox chkItem = (CheckBox)item.FindControl("chkItem_Image");
                        if (chkItem.Checked == true)
                        {
                            Label lblId = (Label)item.FindControl("lblId");
                            ImageController.Delete(Convert.ToInt32(lblId.Text));
                        }
                    }
                    BindImageList();
                    break;
                case "Attachment":
                    foreach (GridViewRow item in gvAttachmentList.Rows)
                    {
                        CheckBox chkItem = (CheckBox)item.FindControl("chkItem_Attachment");
                        if (chkItem.Checked == true)
                        {
                            Label lblId = (Label)item.FindControl("lblId");
                            AttachmentController.Delete(Convert.ToInt32(lblId.Text));
                        }
                    }
                    BindAttachmentList();
                    break;
                default:
                    break;
            }

        }

        protected void ctlPagingControl_PageChanged(object sender, EventArgs e)
        {
            CurrentPage = ctlPagingControl.CurrentPage;
            BindVideoList();
        }
        protected void gvList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            SerialId = Convert.ToInt32(e.CommandArgument);
            VideoInfo objVideo = VideoController.Get(SerialId);
            switch (e.CommandName)
            {
                case "Select":
                    BindSerial(SerialId);
                    SetLayout("SelectSerial");
                    break;
                case "Copy":
                    VideoInfo objNewVideo = objVideo;
                    objNewVideo.UserId = UserId;
                    objNewVideo.Title += "(New)";
                    objNewVideo.Views = 0;
                    int originalVideoId = SerialId;
                    SerialId = VideoController.Add(objNewVideo);
                    //复制自定义数据
                    CopyUserDefinedData(originalVideoId, SerialId);
                    BindSerialList();
                    BindSerial(SerialId);
                    SetLayout("SelectSerial");
                    break;
                case "Del":

                    VideoController.Delete(SerialId);
                    SerialId = -1;
                    BindSerialList();
                    break;
                case "Auth":
                    objVideo.Authed = !objVideo.Authed;
                    VideoController.Update(objVideo,false);
                    BindSerialList();
                    break;
                case "Active":
                    objVideo.Active = !objVideo.Active;
                    VideoController.Update(objVideo,false);
                    BindSerialList();
                    break;
                case "Featured":
                    objVideo.Featured = !objVideo.Featured;
                    VideoController.Update(objVideo,false);
                    BindSerialList();
                    break;

                case "Private":
                    //同时更新其share type 属性
                    if (objVideo.Private == true)//原来是private,变成public
                    {
                        objVideo.ShareType = Convert.ToInt16(ShareType.Public);
                    }
                    else//原来不是private
                    {
                        objVideo.ShareType = Convert.ToInt16(ShareType.Private);
                    }
                    objVideo.Private = !objVideo.Private;
                    VideoController.Update(objVideo,false);
                    BindSerialList();
                    break;

                case "Protected":
                    //同时更新其share type 属性
                    if (objVideo.Protected == true)//原来是Protected,变成public
                    {
                        objVideo.ShareType = Convert.ToInt16(ShareType.Public);
                    }
                    else//原来不是Protected
                    {
                        objVideo.ShareType = Convert.ToInt16(ShareType.Protected);
                    }
                    objVideo.Protected = !objVideo.Protected;
                    VideoController.Update(objVideo,false);
                    BindSerialList();
                    break;

                case "Video":
                    BindVideoList();
                    SetLayout("ViewVideoList");
                    break;

                case "Image":
                    BindImageList();
                    SetLayout("ViewImageList");
                    break;
                case "Attachment":
                    BindAttachmentList();
                    SetLayout("ViewAttachmentList");
                    break;
                default:
                    break;
            }
        }
        private void BindAttachmentList()
        {
            gvAttachmentList.DataSource = AttachmentController.GetByVideo(SerialId);
            gvAttachmentList.DataBind();
        }

        protected void btnAddAttachment_Click(object sender, EventArgs e)
        {
            string url = ctlAttachment.Url;

           
            if (string.IsNullOrEmpty(url))//当前没有选择有效文件，直接返回
            {
                return;
            }
            AttachmentInfo objAttachment = new AttachmentInfo();

            objAttachment.FilePath = ctlAttachment.FullUrl;
            objAttachment.VideoId = SerialId;
            AttachmentController.Add(objAttachment);
            BindAttachmentList();

        }
        protected void gvAttachmentList_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            switch (e.CommandName)
            {
                case "Del":
                    AttachmentController.Delete(id);
                    BindAttachmentList();
                    break;
                default:
                    break;
            }
        }


        private void BindImage()
        {
            ImageInfo objItem = ImageController.Get(ImageId);
            if (objItem == null)
            {
                return;
            }
            txtImageTitle.Text = objItem.Title;
            txtImageFileDescription.Text = objItem.Description;
            ctlImageFile.Url = objItem.ImageFile;
        }

      

      



        protected void gvImageList_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            ImageId = Convert.ToInt32(e.CommandArgument);
            switch (e.CommandName)
            {
                case "Select":
                    BindImage();
                    SetLayout("SelectImage");
                    break;
                case "Del":
                    ImageController.Delete(ImageId);
                    BindImageList();
                    ImageId = -1;
                    break;
                default:
                    break;
            }
        }
        protected void gvVideoList_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            VideoId = Convert.ToInt32(e.CommandArgument);
            switch (e.CommandName)
            {
                case "Select":
                    BindVideo(VideoId);
                    SetLayout("SelectVideo");
                    break;
                case "Del":
                    VideoController.Delete(VideoId);
                    BindVideoList();
                    VideoId = -1;
                    //check if serial has no video in it.
                    if (VideoController.GetBySerial(SerialId).Count < 1)
                    {
                        VideoInfo objSerial = VideoController.Get(SerialId);
                        objSerial.HasVideo = false;
                        VideoController.Update(objSerial,false);
                    }
                    break;
                default:
                    break;
            }
        }
        protected void btnBackToList_Click(object sender, EventArgs e)
        {
            SerialId = -1;
            ImageId = -1;
            SetLayout("ViewSerialList");
        }
        protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
        {
            TypeId = Convert.ToInt32(ddlType.SelectedValue);

            BuildUDFieldForm();
            SerialId = -1;
            CurrentPage = 0;
            ctlVideoFile.Refresh = true;//重新刷新 file list,当type 重新选择后，需要重置有效的文件列表
            BindControl();
            LoadCategories();
            BindTag();
            BindSerialList();
            SetLayout("ViewSerialList");
            CurrentTarget = "Serial";
            DataBind();
        }

        protected void ddlShareType_SelectedIndexChanged(object sender, EventArgs e)
        {
            OnShareType_SelectedIndexChanged(ddlShareType.SelectedValue);
        }
        private void OnShareType_SelectedIndexChanged(string s)
        {
            trProtectPassword.Visible = s == "2";
            trFriends.Visible = s == "3";
            trFollowers.Visible = s == "3";
            trGroups.Visible = s == "3";
        }
        #endregion

    }
}



